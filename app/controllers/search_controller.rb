class SearchController < ApplicationController

  helper_method :sort_direction

  def index
    @search = SearchPresenter.new(query_params)
    @search.register_query
    @search.sort_queries
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
      if params[:query]
        params[:query] = params[:query].downcase
      end
      params.permit(:query, :sort, :direction)
    end

end
