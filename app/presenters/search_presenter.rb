class SearchPresenter

  attr_reader :params_query, :query, :sort, :direction, :sorted


  def initialize(params)
    @params_query = params[:query]
    @query = nil
    @sort = params[:sort]
    @direction = params[:direction]
    @sorted = nil
  end

  def register_query
    if params_query
      @query = Query.find_by(name: params_query)
      if query
        query.search_terms.create!()
      else
        @query = Query.create!(name: params_query)
        query.search_terms.create!()
      end
    end
  end

  def json_response
      EdamamService.new(query.name).json_response
  end

  def create_recipes
    if query
      RecipeService.create_recipes(json_response)
    end
  end

  def sort_queries
    if sort
      @sorted = Query.sort(sort, direction)
    else
      @sored = Query.sort
    end
  end

end
