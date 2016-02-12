class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
end
