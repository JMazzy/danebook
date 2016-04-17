class LikesController < ApplicationController

  def create
    like = Like.new( user_id: current_user.id,
                      likeable_id: params[:likeable_id],
                      likeable_type: params[:likeable_type]
    )
    if like.save
      flash.now[:success] = "#{like.likeable_type} Liked!"

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :show, locals: { like: like } }

      end
    else
      flash.now[:danger] = "Could not like!"

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :fail }

      end
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      flash.now[:success] = "Unliked!"

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :destroy, locals: { like: like } }

      end
    else
      flash.now[:danger] = "Could not unlike!"

      respond_to do |format|

        format.html { redirect_to user_path(current_user) }

        format.js { render :fail }

      end
    end
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
