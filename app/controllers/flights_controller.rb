class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new load search]
  before_action :set_variables, only: %i[index load]
  helper_method :cheapest_flight

  def index
    set_flights
    redirect_to new_flight_path(destiny: @destiny.name) if @flights.count <= 10
  end

  def new
    @destiny = params[:destiny]
  end

  def load
    search = {
      origin: @origin&.code,
      destination: @destiny&.code,
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

  def search; end

  def cheapest_flight
    cheapest_flight = set_flights.minimum('price_cents')
    @cheapest = set_flights.where(price_cents: cheapest_flight)
    @cheapest.first
  end

  def fastest_flight
    duration =

  private

  def set_variables
    # I18n.transliterate(request.location.city) ||
    @origin = City.find_by(name: "New York")
    @destiny = City.find_by(name:params[:destiny] || "Sao Paulo")
    @date = DateTime.now
  end

  def set_flights
    @flights = Flight
               .filter(date: @date, origin_city: @origin.name, destiny_city: @destiny.name)
               .order('departure_time ASC')
  end
end
