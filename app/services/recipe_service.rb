class RecipeService

  def self.create_recipes(recipes)
    recipes[:hits].map do |recipe|
      Recipe.new(recipe)
    end
  end

end
