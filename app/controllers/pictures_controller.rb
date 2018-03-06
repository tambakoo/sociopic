class PicturesController < ApplicationController

before_action :authenticate_user!


	def index
		@pictures = Picture.all.order("created_at DESC")
		@picture = current_user.pictures.new
		respond_to do |format|
			format.html
			format.js
    end
	end

  def new
  	@picture = current_user.pictures.new
  	@pictures = current_user.pictures.all.order("created_at DESC")
  end

	def create
		@picture = current_user.pictures.create(picture_params)
		rescue
    flash[:notice] = "Invalid file selected"
		redirect_to new_picture_path
	end

	def private_feed
		@pictures = current_user.following.map(&:pictures).flatten
		respond_to do |format|
			format.html
			format.js
    end
	end

	def destroy
		@picture = Picture.find_by_id(params[:id])
		@picture.destroy
		redirect_to new_picture_path
	end


	private

	def picture_params
		params.require(:picture).permit(:pic)
	end

end





