class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      flash[:success] = "User successfully created!"
      redirect_to user_path
    else
      flash.now[:danger] = "Could not create user due to errors."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      flash[:success] = "User successfully updated!"
      redirect_to user_path
    else
      flash.now[:danger] = "Could not update user due to errors."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
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
                                  :password_confirmation
    )
  end

end
