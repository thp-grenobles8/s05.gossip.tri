class GossipsController < ApplicationController
  def new
     @tag = Tag.all
  end
  def create
    @gossip = Gossip.new(title:params[:title],content:params[:content],user:User.all.sample)
    @tag = Tag.find_by(title:params[:tag])
    print "$$$"
    puts @tag.id
      if @gossip.save
        @tag = JoinTableGossipTag.create(gossip_id:@gossip.id,tag_id:@tag.id)
        flash[:success] = "Ton potin a été ajouté !"
        redirect_to :root
      else
        flash[:danger] = "Ton potin n'est pas valide !"
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
end
