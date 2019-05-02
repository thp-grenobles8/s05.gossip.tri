class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def new
     @tag = Tag.all
  end
  def create
    @gossip = Gossip.new(title:params[:title],content:params[:content],user:current_user)
    @tag = Tag.find_by(title:params[:tag])
      if @gossip.save
        if @tag != nil
          @tag = JoinTableGossipTag.create(gossip_id:@gossip.id,tag_id:@tag.id)
        end
        flash[:success] = "Ton potin a été ajouté !"
        redirect_to :root
      else
        flash[:danger] = "Ton potin n'est pas valide !"
        @tag = Tag.all
        render :new
      end
  end
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: @gossip.id)
    @tags = JoinTableGossipTag.where(gossip_id: @gossip.id)
  end
  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(title:params[:title],content:params[:content])
      redirect_to :root
      flash[:success] = "Ton potin a été édité !"
    else
      render :edit
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to :root
    flash[:success] = "Le potin a été supprimé !"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in to perform this action."
      redirect_to new_session_path
    end
  end
end
