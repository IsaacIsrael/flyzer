module SkyscannerHelper
  def self.flight_list(params)
    response = live_flight_search(params)

    # itineraries = response.body["Itineraries"]
    # places = response.body["Places"]
    # legs = response.body["Legs"].each do |leg|
    #   leg["OriginStation"] = places.find { |item| item["Id"] == leg["OriginStation"] }
    #   leg["OriginStation"] = places.find { |item| item["Id"] == leg["OriginStation"] }
    #   # leg["Stops"].map { |number| places.find { |item| item["Id"] == number } }
    # end
    # teste = itineraries[0]
    # search = legs.find { |item| item["Id"] == teste["OutboundLegId"] }
  end

  private

  def self.live_flight_search(params)
    response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/a5244fba-c973-4dae-8ac8-fe5547c4bb4b?pageIndex=0&pageSize=10",
      headers:{
        "X-RapidAPI-Key" => ENV['SKYSCANNER_API_KEY'],
        "Accept" => "application/json"
      },
      parameters: generate_sesion_key(params)
      raise
  end

  def self.generate_sesion_key(params)
    response = post_create_session(params)
    response.headers[:location].split('/').last
  end

  def self.post_create_session(params)
     response = Unirest.post "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0",
      headers: {
        "X-RapidAPI-Key" => ENV['SKYSCANNER_API_KEY'],
        "Content-Type" => "application/x-www-form-urlencode",
        "Accept" => "application/json"
      },
      parameters: params.reject { |_, value| value.empty? }
  end

  private_class_method :post_create_session, :generate_sesion_key, :live_flight_search
end
