class UsersController < ApplicationController
  before_action :require_current_user, only: [:edit, :update, :destroy]

  skip_before_action :require_login, only: [:new, :create, :index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new( user_params )
    if @user.save
      sign_in(@user)
      flash[:success] = "User successfully created!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Could not create user due to errors."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update( user_params )
      flash[:success] = "User successfully updated!"
      redirect_to current_user
    else
      flash.now[:danger] = "Could not update user due to errors."
      render :edit
    end
  end

  def destroy
    if current_user.destroy
      sign_out
      flash[:success] = "User successfully deleted!"
    else
      flash[:danger] = "User could not be deleted due to errors."
    end
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit( :email,
                                  :password,
                                  :password_confirmation,
                                  { profiles_attributes: [
                                      :first_name,
                                      :last_name,
                                      :gender,
                                      :birthday,
                                      :school,
                                      :hometown,
                                      :currently_lives,
                                      :phone_number,
                                      :words_to_live_by,
                                      :about_me
                                    ] }
    )
  end

end
