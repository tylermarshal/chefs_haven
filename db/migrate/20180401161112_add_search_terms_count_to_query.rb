class AddSearchTermsCountToQuery < ActiveRecord::Migration[5.1]
  def change
    add_column :queries, :search_terms_count, :integer, default: 0
  end
end
