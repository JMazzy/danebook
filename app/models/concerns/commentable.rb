require 'active_support/concern'

module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :subcomments, class_name: "Comment", foreign_key: :commentable_id, as: :commentable
  end
end
