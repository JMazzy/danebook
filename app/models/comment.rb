class Comment < ActiveRecord::Base
  include Likeable

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :subcomments, class_name: "Comment", foreign_key: :commentable_id, as: :commentable

  validates :body, presence: true, length: { in: 3..255 }

  def sorted_comments
    self.subcomments.order("created_at DESC")
  end
end
