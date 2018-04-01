class SearchTerm < ApplicationRecord
  belongs_to :query
  scope :sort_date, -> { order('created_at desc') }
end
