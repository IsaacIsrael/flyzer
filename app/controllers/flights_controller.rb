class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    teste = SkyscannerHelper.flight_list(serch_parms.to_h)
    raise
  end

  private

  def serch_parms
    params.require(:search).permit(:country, :currency, :locale, :originPlace,
      :destinationPlace, :outboundDate, :adults, :inboundDate, :cabinClass,
      :children, :infants, :includeCarriers, :groupPrincing)
  end
end
