class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:create]

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        # helper method to sign user in (in application_controller)
        sign_in(@user)
      end

      flash[:success] = "You've successfully signed in!"
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = "We couldn't sign you in."
      redirect_to root_url
    end
  end

  def destroy
    # the helper method to sign out (in application_controller)
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_url
  end
end
