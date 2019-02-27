class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @flights = Flight.sort_flights_by_date
  end

  private

  def serch_parms
    params.require(:search).permit(:country, :currency, :locale, :originPlace,
      :destinationPlace, :outboundDate, :adults, :inboundDate, :cabinClass,
      :children, :infants, :includeCarriers, :groupPrincing)
  end
end
