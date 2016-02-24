class Post < ActiveRecord::Base
  include Likeable

  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable

  validates :body, presence: true, length: { in: 3..255 }

  after_create :create_stories

  def create_stories
    (self.user.friends + [user]).uniq.each do |user|
      Story.create( subject: self, name: "post_created", direction: "to", user: user )
    end
  end

  def sorted_comments
    self.comments.order("created_at DESC")
  end
end
