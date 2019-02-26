class AmadeusService
  def self.client
    Amadeus::Client.new(
      client_id: ENV['AMADEUS_API_KEY'],
      client_secret: ENV['AMADEUS_SECRET']
    )
  end

  def self.flight_offers(params)
    client.shopping.flight_offers.get(params).result
  end

  private_class_method :client
end
