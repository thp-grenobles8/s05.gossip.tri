class StaticPagesController < ApplicationController
  def welcome
    puts "$" * 60 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
    puts params[:username] #tu sais que params doit s'afficher entre les 2
    puts "$" * 60
  end
  def home
    puts "$" * 60 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
    puts params[:username] #tu sais que params doit s'afficher entre les 2
    puts "$" * 60
    @gossips = Gossip.all
  end
end
