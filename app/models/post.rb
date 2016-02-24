class Post < ActiveRecord::Base
  include Likeable
  include Storyable

  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable

  validates :body, presence: true, length: { in: 3..255 }

  def sorted_comments
    self.comments.order("created_at DESC")
  end
end
