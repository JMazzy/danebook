class LikesController < ApplicationController

  def create
    like = Like.new( user_id: current_user.id,
                      likeable_id: params[:likeable_id],
                      likeable_type: params[:likeable_type]
    )
    if like.save
      flash[:success] = "#{like.likeable_type} Liked!"
    else
      flash[:danger] = "Could not like!"
    end
    redirect_to :back
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      flash[:success] = "Unliked!"
    else
      flash[:danger] = "Could not unlike!"
    end
    redirect_to :back
  end

  def index
    @likes = extract_likeable.likes
  end
  private
  def extract_likeable
    resource, id = request.path.split('/')[1,2]
    resource.singularize.classify.constantize.find(id)
  end

  def like_params
    params.require(:like).permit( :user_id,
                                  :likeable_id,
                                  :likeable_type )
  end
end
