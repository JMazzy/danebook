class Post < ActiveRecord::Base
  include Likeable

  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable

  def sorted_comments
    self.comments.order("created_at DESC")
  end
end
