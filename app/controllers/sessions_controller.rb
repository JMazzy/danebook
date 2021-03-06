class SessionsController < ApplicationController
  before_action :require_logout, only: [ :new, :create ]
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to login_path
  end

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
      redirect_to user_path(@user)
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
