class RelationshipsController < ApplicationController

before_action :authenticate_user!



  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to pictures_path
		respond_to do |format|
			format.html { redirect_to pictures_path}
			format.js
    end

  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to :back
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end




end
