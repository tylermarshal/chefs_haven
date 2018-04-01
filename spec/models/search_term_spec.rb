require 'rails_helper'

describe SearchTerm do
  context "class_methods" do
    context ".sort_date" do
      it "sorts search terms by created_at date" do
        chicken_alfredo = create(:query)
        search_1 = chicken_alfredo.search_terms.create(created_at: Time.now - 1000)
        search_2 = chicken_alfredo.search_terms.create(created_at: Time.now)

        expect(chicken_alfredo.search_terms.sort_date).to eq([search_2, search_1])
      end
    end
  end
end
