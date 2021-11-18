class ImagesController < ApplicationController
    def new
        # @album = Album.find(params[:id])
        # @image = @album.images.new
        @image = Image.new
    end
    def create
        @album = Album.find(params[:album_id])
        @image = @album.images.create(image_params)
        if @image.save
            redirect_to user_album_path(id: @album.id)
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @image = @album.images.find(params[:album_id])
        @image.destroy
        redirect_to user_album_path
    end


    private
    def image_params
        params.permit(:image, :name, :all_tags)
    end

end

