class PostsController < ApplicationController

  skip_before_action :require_login, only: [:index]
  skip_before_action :require_current_user

  def index
    # Will be used for the "news feed..."
  end

  def create
    current_user.posts.build( post_params )
    if current_user.save
      flash[:success] = "Post created successfully!"
    else
      flash[:danger] = "Failed to create post."
    end
    redirect_to user_path(current_user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.user == current_user && post.destroy
      flash[:success] = "Post deleted successfully!"
    else
      flash[:danger] = "Failed to delete post."
    end
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit( :body )
  end

end
