class StoriesController < ApplicationController

  skip_before_action :require_login, only: [:index]

  def index
    if signed_in_user?
      @stories = Story.where( user: current_user ).order(created_at: :desc)
      @active_users = ( @stories.map { |s| s.subject.user } ).uniq
      @new_post = current_user.posts.build
      @new_comment = current_user.comments.build
    else
      redirect_to login_path
    end
  end

end
