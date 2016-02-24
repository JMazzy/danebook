class Photo < ActiveRecord::Base
  include Likeable
  include Storyable

  belongs_to :user, inverse_of: :photos
  has_many :comments, as: :commentable

  has_attached_file :image, styles: { medium: "200x200#", thumb: "75x75#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true, allow_blank: false, allow_nil: false

  def sorted_comments
    self.comments.order("created_at DESC")
  end
end
