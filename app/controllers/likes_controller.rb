class LikesController < ApplicationController
  def create
    @like = Like.create(user_id:current_user.id,gossip_id:params[:gossip_id])
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @like = Like.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

end
