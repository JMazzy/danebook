class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.sorted_posts
    @profile = @user.profile
    @new_post = @user.posts.build
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.build( post_params )
    if user.save
      flash[:success] = "Post created successfully!"
    else
      flash[:danger] = "Failed to create post."
    end
    redirect_to user_posts_path(user)
  end

  private

  def post_params
    params.require(:post).permit( :body )
  end

end
