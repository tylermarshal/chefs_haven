class SearchTerm < ApplicationRecord
  belongs_to :query, counter_cache: true

  before_save :update_query

  scope :sort_date, -> { order('created_at desc') }

  def update_query
    query.update_attributes(updated_at: Time.now)
  end
end
