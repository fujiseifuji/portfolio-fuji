class Map < ApplicationRecord
  belongs_to :post

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
