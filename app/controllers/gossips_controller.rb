class GossipsController < ApplicationController
  def new
    puts 'okayy'
   puts @gossip
  end
  def create
    @gossip = Gossip.new(title:params[:title],content:params[:content],user:User.all.sample)
      if @gossip.save
        redirect_to :root
        flash[:success] = "Ton potin a été ajouté !"
      else
        render :new
        flash[:danger] = "Ton potin n'est pas valide !"
        puts @gossip
      end
  end
  def show
    @gossip = Gossip.find(params[:id].to_i)
  end
end
