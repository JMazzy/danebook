class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable
  has_many :subcomments, class_name: "Comment", foreign_key: :commentable_id, as: :commentable
end
