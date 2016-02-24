class PhotosController < ApplicationController
  skip_before_action :require_current_user, only: [:index, :show]

  def index
    user_id = params[:user_id] || current_user.id
    @user = User.find(user_id)
    @photos = Photo.where(user_id: user_id)
  end

  def show
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @new_comment = current_user.comments.build
  end

  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    if params[:photo] && params[:photo][:image]
      @user = current_user
      image = params[:photo][:image]
      @photo = Photo.new

      if image.is_a?(String)
        @photo.image = open(image)
      else
        @photo.image = image
      end

      @photo.user_id = current_user.id

      if @photo.save
        flash[:success] = "Photo created!"
        redirect_to photo_path(@photo)
      else
        flash.now[:danger] = "Photo could not be created."
        render :new
      end
    else
      flash.now[:danger] = "Photo could not be created."
      render :new
    end
  end

  def edit
    @user = current_user
    @photo = Photo.find(params[:id])
  end

  def update
    @user = current_user
    @photo = Photo.find(params[:id])
    if @photo.update( photo_params )
      flash[:success] = "Photo updated!"
      redirect_to photo_path(@photo)
    else
      flash.now[:danger] = "Photo could not be updated."
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = "Photo deleted!"
      redirect_to photos_path( user_id: current_user.id )
    else
      flash[:danger] = "Photo could not be deleted."
      redirect_to :back
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
