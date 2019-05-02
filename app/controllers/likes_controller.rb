class LikesController < ApplicationController
  def create
    @like = Like.create(user_id:current_user.id,gossip_id:params[:gossip_id])
    redirect_to gossip_path(params[:gossip_id])
  end
  def destroy
    @like = Like.destroy(params[:id])
    redirect_to gossip_path(params[:gossip_id])
  end

end
