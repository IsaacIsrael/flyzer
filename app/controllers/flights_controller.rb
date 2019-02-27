class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @flights = Flight.all
    request.location
    raise
  end
end
