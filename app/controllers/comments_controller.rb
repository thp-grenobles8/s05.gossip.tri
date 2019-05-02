class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create,:edit,:update,:create,:destroy]
  def new
  end
  def create
    id = params[:gossip_id].to_i
    @comment = Comment.new(content:params[:content],gossip_id:id.to_i,author_id:current_user.id)
    if @comment.save
      flash[:success] = "Ton commentaire a été ajouté !"
      redirect_to gossip_path(id)
    else
      @gossip = Gossip.find(id)
      flash[:danger] = "Ton commentaire n'est pas valide !"
      redirect_to gossip_path(id)
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content:params[:content])
      flash[:success] = "Ton commentaire a été édité !"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Ton commentaire n'est pas valide !"
      render :edit
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Le commentaire a été supprimé !"
    redirect_to gossip_path(@comment.gossip.id)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in to perform this action."
      redirect_to new_session_path
    end
  end
end
