class ShowController < ApplicationController
  def gossips
    @gossip = Gossip.find(params[:gossip_id].to_i)
  end
  def authors
    @author = User.find(params[:author_id].to_i)
  end
end
