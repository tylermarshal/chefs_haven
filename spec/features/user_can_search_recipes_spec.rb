require 'rails_helper'

describe "a user visits the homepage" do
  context "a user sees a search history" do
    context "the user searches for a recipe" do
      it "the user sees recipe data returned" do

        visit "/"

        expect(page).to have_content("What's for dinner?")
        expect(page).to have_css(".search-field")

        expect(page).to have_content("Past Searches")
        expect(page).to have_css(".search-history")

        fill_in "query", with: "chicken"

        click_button "Find Recipes"

        expect(current_path).to eq("/")

        expect(page).to have_content("chicken")

        expect(page).to have_content("Search Results")
        expect(page).to have_css(".search-results")
        expect(page).to have_css(".recipe", maximum: 10)

        within(first(".recipe")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".yield")
          expect(page).to have_css(".calories")
          expect(page).to have_css(".ingredients")
        end

      end
    end
  end
end
