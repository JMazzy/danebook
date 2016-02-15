class CommentsController < ApplicationController
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

  def index
    @comments = extract_commentable.comments
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
