require 'active_support/concern'

module Storyable
  extend ActiveSupport::Concern

  included do
    after_create :create_stories
  end

  def create_stories
    (self.user.friends.to_a + [self.user]).each do |story_user|
      Story.create( subject: self,
                    name: "#{self.class.to_s.downcase}_created",
                    user: story_user,
                    created_at: self.created_at,
                    updated_at: self.updated_at )
    end
  end
end
