class FriendingsController < ApplicationController

  def create
    friendee = User.find(params[:friendee_id])
    friending = Friending.new(  friender_id: current_user.id,
                                friendee_id: friendee.id )
    if friending && friending.save
      flash[:success] = "Friend added!"
    else
      flash[:danger] = "Could not add friend!"
    end
    redirect_to :back
  end

  def destroy
    friendee = User.find(params[:friendee_id])
    friending = Friending.find_by(  friender_id: current_user.id,
                                    friendee_id: friendee.id )

    if friending && friending.destroy
      flash[:success] = "Friend removed!"
    else
      flash[:danger] = "Could not unfriend!"
    end
    redirect_to :back
  end
end
