class Post < ActiveRecord::Base
  include Likeable

  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable


end
