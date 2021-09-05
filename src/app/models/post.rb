class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot
end
