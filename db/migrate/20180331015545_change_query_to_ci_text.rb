class ChangeQueryToCiText < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")
    change_column :queries, :name, :citext
  end
end
