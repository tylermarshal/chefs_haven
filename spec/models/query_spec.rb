require 'rails_helper'

describe Query do
  context "class methods" do
    context ".sort" do
      it "sorts query objects by attribute" do
        lasagna = create(:query, name: "lasagna", updated_at: Time.now)
        pasta = create(:query, name: "pasta", updated_at: Time.now - 500, search_terms_count: 7)
        chicken_alfredo = create(:query, updated_at: Time.now - 1000, search_terms_count: 2)

        expect(Query.sort("name", "asc")).to eq([chicken_alfredo, lasagna, pasta])
        expect(Query.sort("name", "desc")).to eq([pasta, lasagna, chicken_alfredo])
        expect(Query.sort("updated_at", "desc")).to eq([lasagna, pasta, chicken_alfredo])
        expect(Query.sort("updated_at", "asc")).to eq([chicken_alfredo, pasta, lasagna])
        expect(Query.sort("search_terms_count", "desc")).to eq([pasta, chicken_alfredo, lasagna])
        expect(Query.sort("search_terms_count", "asc")).to eq([lasagna, chicken_alfredo, pasta])
      end
    end
  end
end
