class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new load search]
  before_action :set_variables, only: %i[index show load]
  helper_method :cheapest_flight, :fastest_flight, :most_convenient_flight
  before_action :find_flight, only: %i[show]

  def index
    set_flights
    redirect_to new_flight_path(destiny: @destiny.name) if @flights.count <= 10
  end

  def show
    @order = Order.new
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

  def search
    @cities = City.all
  end

  def cheapest_flight
    set_flights('price_cents ASC, (arrival_time - departure_time) ASC').first
  end

  def fastest_flight
    set_flights('(arrival_time - departure_time) ASC, price_cents ASC').first
  end

  def most_convenient_flight
    set_flights('convenience ASC').first
  end

  private

  def set_variables
    # I18n.transliterate(request.location.city) ||
    @origin = City.find_by(name: "New York")
    @destiny = City.find_by(name:params[:destiny] || "Sao Paulo")
    @date = DateTime.now
  end

  def set_flights(criterion = 'departure_time ASC')
    @flights = Flight
               .filter(date: @date, origin_city: @origin.name, destiny_city: @destiny.name)
               .order(criterion)
  end

  def find_flight
    @flight = Flight.find(params[:id])
  end
end
