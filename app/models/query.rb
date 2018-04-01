class Query < ApplicationRecord

  has_many :search_terms

  def self.sort(search_term = "updated_at", direction = "desc")
    order("#{search_term} #{direction}")
  end

end
