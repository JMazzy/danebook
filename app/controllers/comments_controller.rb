class CommentsController < ApplicationController

  def new
    @comment = current_user.comments.build( comment_params )

    respond_to do |format|

      format.html { redirect_to user_path(current_user) }

      format.js { render :new, locals: { comment: @comment, id: @comment.commentable_id, type: @comment.commentable_type } }

    end
  end

  def create

    comment = Comment.new( comment_params )

    comment.user_id = current_user.id
    if comment.save
      flash.now[:success] = "Comment created!"

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :show, locals: { comment: comment } }

      end
    else
      flash.now[:danger] = "No comment created."

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :fail }

      end
    end
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
