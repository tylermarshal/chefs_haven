require 'rails_helper'

describe Recipe do
  it "exists" do
    attrs =
      {:recipe=>
       {:uri=>"http://www.edamam.com/ontologies/edamam.owl#recipe_3f0ce55d11f4a075bb39c2091e59e261",
        :label=>"Deep Fried Fish Bones",
        :image=>"https://www.edamam.com/web-img/c8c/c8ccf12e2aa2c78b94817f18cd4eaff2.jpg",
        :source=>"Serious Eats",
        :url=>"http://www.seriouseats.com/recipes/2011/03/deep-fried-fish-bones-recipe.html",
        :shareAs=>"http://www.edamam.com/recipe/deep-fried-fish-bones-3f0ce55d11f4a075bb39c2091e59e261/fish",
        :yield=>4.0,
        :dietLabels=>["Low-Carb"],
        :healthLabels=>["Sugar-Conscious", "Peanut-Free", "Tree-Nut-Free", "Alcohol-Free"],
        :cautions=>[],
        :ingredientLines=>["8 small whiting fish or smelt", "4 cups vegetable oil"],
        :ingredients=>[{:text=>"8 small whiting fish or smelt", :weight=>1136.0}, {:text=>"4 cups vegetable oil", :weight=>896.0}],
        :calories=>2608.256,
        :totalWeight=>1306.4,
        :totalTime=>31.0,
        }
      }
    recipe = Recipe.new(attrs)
    expect(recipe).to be_a(Recipe)
    expect(recipe.name).to eq("Deep Fried Fish Bones")
    expect(recipe.yield).to eq(4.0)
    expect(recipe.calories).to eq(2608)
    expect(recipe.url).to eq("http://www.seriouseats.com/recipes/2011/03/deep-fried-fish-bones-recipe.html")
    expect(recipe.ingredients).to be_a(Array)
    expect(recipe.ingredients.count).to eq(2)
  end
end
