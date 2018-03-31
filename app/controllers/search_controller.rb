class SearchController < ApplicationController

  def index
    if params[:query]
      Query.create!(name: params[:query])
      conn = Faraday.new(:url => 'https://api.edamam.com') do |faraday|
        faraday.adapter  Faraday.default_adapter
      end
      response = conn.get("/search?q=#{params[:query]}&count=10&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
      parsed = JSON.parse(response.body, symbolize_names: true)
      @recipes = parsed[:hits].map do |recipe|
        Recipe.new(recipe)
      end
    end
  end

end
