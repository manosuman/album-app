class ImagesController < ApplicationController
    def create
        @album = Album.find(params[:album_id])
        @image = @album.images.create(image_params)
        redirect_to @album
    end

    def destroy
        @album = Album.find(params[:id])
        @image = @album.images.find(params[:album_id])
        @image.destroy
        redirect_to albums_path
    end


    private
    def image_params
        params.require(:image).permit(:image, :name)
    end

end

