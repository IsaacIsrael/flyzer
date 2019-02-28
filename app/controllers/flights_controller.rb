class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @city = City.find_by(name: I18n.transliterate(request.location.city || ""))&.code
    @date = Date.today.strftime("%Y-%m-%d")
    @flights = Flight.all
  end
end
