class Comment < ActiveRecord::Base
  include Likeable

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :subcomments, class_name: "Comment", foreign_key: :commentable_id, as: :commentable
end
