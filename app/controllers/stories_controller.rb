class StoriesController < ApplicationController

  def index
    @stories = Story.where( user: current_user ).order(created_at: :desc)
    @active_users = ( @stories.map { |s| s.subject.user } ).uniq
    @new_post = current_user.posts.build
    @new_comment = current_user.comments.build
  end

end
