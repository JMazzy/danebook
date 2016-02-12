class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update( profile_params )
      flash[:success] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash.now[:warning] = "Could not save your changes."
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
                                      :about_me
    )
  end

end
