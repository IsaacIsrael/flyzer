class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new load search show]

  before_action :set_variables, only: %i[index load]
  before_action :find_flight, only: %i[show]

  helper_method :cheapest_flight, :fastest_flight, :most_convenient_flight, :url_params

  def index
    set_flights
    redirect_to new_flight_path(url_params) if @flights.count <= 10
  end

  def show
    @order = Order.new
  end

  def new
    @ticket = params[:ticket]
    @destination = params[:destination]
  end

  def load
    search = {
      origin: @origin&.code,
      destination: @destination.code,
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
    @cities = City.all.order('name')
  end

  def url_params
    @ticket ? { ticket: @ticket } : { destination: @destination }
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
    @ticket = params[:ticket] ? Ticket.find(params[:ticket]) : nil

    #  @origin = City.find_by(name: I18n.transliterate(request.location.city))
    @origin = @ticket&.origin || City.find_by(name: "New York")
    @destination = @ticket&.destination || City.find(params[:destination])
    @date = @ticket&.departure_time || DateTime.now
  end

  def set_flights(criterion = 'departure_time ASC')
    filter = params[:ticket] ? { date: @date, origin_name: @origin.name, destination_name: @destination.name } : {date: @date, origin_city: @origin.name, destination_city: @destination.name}
    @flights = Flight.filter(filter).order(criterion)
  end

  def find_flight
    @flight = Flight.find(params[:id])
  end
end
