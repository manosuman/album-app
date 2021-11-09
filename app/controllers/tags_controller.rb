class TagsController < ApplicationController
  def index
  end
  def create
    @image =Image.find(params[:image_id])
    @tag = @image.tags.create(tag_params)
    redirect_to album_image_path
  end

  private
  def tag_params
    params.require(:tag).permit(:tag)
  end
end
