class ProfilesController < ApplicationController

  skip_before_action :require_login, only: [:show]
  skip_before_action :require_current_user, only: [:show]

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update( profile_params )
      flash[:success] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash.now[:danger] = "Could not save your changes."
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(  :first_name,
                                      :last_name,
                                      :gender,
                                      :birthday,
                                      :school,
                                      :hometown,
                                      :currently_lives,
                                      :phone_number,
                                      :words_to_live_by,
                                      :about_me,
                                      :profile_photo_id,
                                      :cover_photo_id
    )
  end

end
