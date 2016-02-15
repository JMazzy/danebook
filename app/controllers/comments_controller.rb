class CommentsController < ApplicationController

  skip_before_action :require_current_user

  def create
    comment = Comment.new( comment_params )
    comment.user_id = current_user.id
    if comment.save
      flash[:success] = "Comment created!"
    else
      flash[:danger] = "No comment created."
    end
    redirect_to :back
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user == current_user && comment.destroy
      flash[:success] = "Comment deleted!"
    else
      flash[:danger] = "Comment NOT deleted!"
    end
    redirect_to :back
  end

  private

  def extract_commentable
    resource, id = request.path.split('/')[1,2]
    resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
