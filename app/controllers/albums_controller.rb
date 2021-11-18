class AlbumsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @albums = @user.albums.all
    # @albums = Album.all
  end

  def show
    @user = User.find(current_user.id)
    @album = @user.albums.find_by_id(params[:id])
    # @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  # def create
  #   @album = Album.new(album_params)

  #   if @album.save
  #     redirect_to albums_path
  #   else
  #     render :new
  #   end
  # end

  def create
    # debugger
    @user = User.find(current_user.id)
    @album = @user.albums.create(album_params)
    if @album.save
      redirect_to user_albums_path
    else
      render :new
    end
    # @album.save!
    # redirect_to user_albums_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to user_albums_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_albums_path
  end

  private
    def album_params
      params.permit(:title, :description)
    end
end

