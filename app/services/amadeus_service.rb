class AmadeusService
  def self.client
    Amadeus::Client.new(
      client_id: ENV['AMADEUS_API_KEY'],
      client_secret: ENV['AMADEUS_SECRET']
    )
  end

  def self.flight_offers(params)
    response = client.shopping.flight_offers.get(params).result
    response["data"].map { |item| build_response_flight_offers(item) }
  end

  def self.build_response_flight_offers(item)
    stops = item["offerItems"][0]["services"][0]["segments"]
    departure = stops.first["flightSegment"]["departure"]
    arrival = stops.last["flightSegment"]["arrival"]
    carrier = stops.first["flightSegment"]["carrierCode"]
    {
      amadeus_id: item["id"],
      departure_time: departure["at"],
      arrival_time: arrival["at"],
      available_seats: stops.map { |flight| flight["pricingDetailPerAdult"]["availability"] }.min,
      origin_id: Place.find { |origin| origin.code == departure["iataCode"] }&.id,
      destiny_id: Place.find { |destiny| destiny.code == arrival["iataCode"] }&.id,
      company_id:  Company.find { |company| company.iata == carrier }&.id,
      price: item["offerItems"][0]["price"].values.map(&:to_f).inject(0, :+).to_money,
      stops_attributes: build_stops_flight_offers(stops)
    }
  end

  def self.build_stops_flight_offers(stops)
    stops[1..-1].each_with_index.map do |stop, index|
      arrivel_time = Time.parse(stops[index]["flightSegment"]["arrival"]["at"])
      departure_time = Time.parse(stop["flightSegment"]["departure"]["at"])
      {
        duration: (departure_time - arrivel_time).ceil,
        place_id: Place.find { |destiny| destiny.code == stop["flightSegment"]["departure"]["iataCode"] }&.id,
      }
    end
  end

  private_class_method :client, :build_response_flight_offers,
                       :build_stops_flight_offers
end
