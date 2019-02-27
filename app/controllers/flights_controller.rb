class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @flights = Flight.sort_flights_by_date
  end

end
