class FlightsController < ApplicationController
  before_action :find_flight, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index, show]
  def index
    @city = City.find_by(name: I18n.transliterate(request.location.city || ""))&.code
    @date = Date.today.strftime("%Y-%m-%d")
    @flights = Flight.sort_flights_by_date
  end

  def show; end

  private

  def find_flight
    @flight = Flight.find(params[:id])
  end
end
