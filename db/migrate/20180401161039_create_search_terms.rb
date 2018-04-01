class CreateSearchTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :search_terms do |t|
      t.references :query, foreign_key: true

      t.timestamps
    end
  end
end
