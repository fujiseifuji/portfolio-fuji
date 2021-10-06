# frozen_string_literal: true

module ApplicationHelper
  def avatar_url(user)
    return user.profile_photo unless user.profile_photo.nil?
  end
end
