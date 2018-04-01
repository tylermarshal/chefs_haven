class EdamamService

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def conn
    Faraday.new(:url => 'https://api.edamam.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    conn.get("/search?q=#{query}&count=10&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
  end

  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end

end
