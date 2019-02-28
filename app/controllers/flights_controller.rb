class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_varibales, only: %i[index load]

  def index
    set_flights
    redirect_to new_flight_path(destiny: @destiny) if @flights.count <= 10
  end

  def new
    @destiny = params[:destiny]
  end

  def load
    search = {
      origin: City.find_by(name: @origin || "")&.code,
      destination: City.find_by(name: @destiny || "")&.code,
      departureDate: @date.strftime("%Y-%m-%d"),
      currency: 'BRL'
    }
    Flight.create(AmadeusService.flight_offers(search))
    set_flights
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search ; end

  private

  def set_varibales
    # I18n.transliterate(request.location.city) ||
    @origin = "New York"
    @destiny = params[:destiny] || "Sao Paulo"
    @date = DateTime.now
  end

  def set_flights
    @flights = Flight
      .filter(date: @date, origin_city: @origin, destiny_city: @destiny)
      .order('departure_time ASC')
  end
end
