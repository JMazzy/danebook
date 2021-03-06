class UsersController < ApplicationController
  before_action :require_logout, only: [ :new, :create ]
  skip_before_action :require_login, only: [ :new, :create ]

  def index
    if params[:query]
      @user = current_user
      @users = User.search(params[:query])
    else
      @user = params[:user_id] ? User.find(params[:user_id]) : current_user
      @users = @user.friends
    end
  end

  def show
    @user = User.find(params[:id])

    if @user == current_user
      @new_post = current_user.posts.build
    end

    @new_comment = current_user.comments.build
  end

  def new
    @user = User.new
    @profile = @user.build_profile
  end

  def create
    @user = User.new( user_params )
    if @user.save
      sign_in(@user)
      flash[:success] = "User successfully created!"

      User.delay.send_welcome_email(@user.id)

      redirect_to edit_profile_path(@user.profile)
    else
      flash.now[:danger] = "User could not be created due to errors."
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
                                  { profile_attributes: [
                                      :id,
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
