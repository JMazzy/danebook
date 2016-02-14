class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  def user_like(user_id)
    self.likes.find_by( user_id: user_id )
  end

  def liked?(user_id)
    !!user_like(user_id)
  end
end
