class User < ActiveRecord::Base
  before_create :generate_token

  has_many :posts, inverse_of: :user
  has_many :photos, inverse_of: :user
  has_many :comments
  has_many :likes

  has_many :initiated_friendings, class_name: "Friending",
                                  foreign_key: :friender_id
  has_many :friends,              through: :initiated_friendings,
                                  source: :friendee

  has_many :received_friendings,  class_name: "Friending",
                                  foreign_key: :friendee_id
  has_many :frienders,            through: :received_friendings,
                                  source: :friender

  has_one :profile, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :profile

  validates :email, presence: true, uniqueness: true
  validates :password,
            length: { in: 8..24 },
            allow_nil: true

  has_secure_password

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(auth_token: self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  def sorted_posts
    self.posts.order("created_at DESC")
  end

  def full_name
    "#{profile.first_name} #{profile.last_name}"
  end
end
