class Post < ApplicationRecord
  belongs_to :user
  has_one :map, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :map

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
