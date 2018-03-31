class Recipe

  attr_reader :name, :url, :yield, :calories, :ingredients

  def initialize(recipe)
    @name = recipe[:recipe][:label]
    @url = recipe[:recipe][:url]
    @yield = recipe[:recipe][:yield]
    @calories = recipe[:recipe][:calories]
    @ingredients = recipe[:recipe][:ingredientLines].map {|ingredient| Ingredient.new(ingredient)}
  end

end
