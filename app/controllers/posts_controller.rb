class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.sorted_posts
    @profile = @user.profile
    if @user == current_user
      @new_post = current_user.posts.build
    end
  end

  def create
    current_user.posts.build( post_params )
    if current_user.save
      flash[:success] = "Post created successfully!"
    else
      flash[:danger] = "Failed to create post."
    end
    redirect_to user_posts_path(current_user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.user == current_user && post.destroy
      flash[:success] = "Post deleted successfully!"
    else
      flash[:danger] = "Failed to delete post."
    end
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit( :body )
  end

end
