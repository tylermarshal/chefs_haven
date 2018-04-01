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
      json_response = EdamamService.new(params[:query]).json_response
      @recipes = RecipeService.create_recipes(json_response)
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
