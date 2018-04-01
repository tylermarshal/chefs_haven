class Query < ApplicationRecord

  has_many :search_terms

  def self.sort(search_term, direction)
    order("#{search_term} #{direction}")
  end

end
