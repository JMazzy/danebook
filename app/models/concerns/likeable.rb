require 'active_support/concern'

module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable
  end

  # return the "like" object corresponding to given user for the object
  def user_like(user_id)
    likes.find_by( user_id: user_id )
  end

  # returns true if a user has liked the current likeable object
  def liked?(user_id)
    !!user_like(user_id)
  end
end
