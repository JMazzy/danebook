class Photo < ActiveRecord::Base
  include Likeable

  belongs_to :user, inverse_of: :photos
  has_many :comments, as: :commentable

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/png", "image/jpg", "image/jpeg", "image/gif"]

  def image_from_url(url)
    self.image = open(url)
  end

  validates :image, presence: true
end
