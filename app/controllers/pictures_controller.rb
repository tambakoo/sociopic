class PicturesController < ApplicationController

	def index
		@pictures = Picture.all.order("created_at DESC")
		@picture = current_user.pictures.new
	end

  def new
  	@picture = current_user.pictures.new
  	@pictures = current_user.pictures.all.order("created_at DESC")
  end

	def create
		@picture = current_user.pictures.create(picture_params)
		redirect_to new_picture_path
	end

	def private_feed
		@pictures = current_user.following.map(&:pictures).flatten
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to :back
	end


	private

	def picture_params
		params.require(:picture).permit(:pic)
	end

end





