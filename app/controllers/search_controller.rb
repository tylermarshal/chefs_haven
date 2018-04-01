class SearchController < ApplicationController

  helper_method :sort_direction

  def index
    if params[:query]
      @query = Query.find_by(name: params[:query])
      if @query
        @query.search_terms.create!()
      else
        @query = Query.create!(name: params[:query])
        @query.search_terms.create!()
      end
      conn = Faraday.new(:url => 'https://api.edamam.com') do |faraday|
        faraday.adapter  Faraday.default_adapter
      end
      response = conn.get("/search?q=#{params[:query]}&count=10&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
      parsed = JSON.parse(response.body, symbolize_names: true)
      @recipes = parsed[:hits].map do |recipe|
        Recipe.new(recipe)
      end
    end
    if params[:sort]
      @search = Query.sort(params[:sort], params[:direction])
    else
      @search = Query.sort
    end
  end

  private

    def sort_direction
      if %w[asc desc].include?(params[:direction])
        params[:direction]
      else
       "asc"
      end
    end

    def query_params
      params[:query] = params[:query].downcase
      params.permit(:query, :sort, :direction)
    end

end
