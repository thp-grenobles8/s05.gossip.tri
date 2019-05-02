class UsersController < ApplicationController
  def new
  end
  def create
    @city = City.find_by(name:params[:city])
      if @city == nil
        City.create(name:params[:city])
        @city = City.find_by(name:params[:city])
      end
    @user = User.new(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password],description:params[:description],age:params[:age],city:@city)
    if @user.save
      flash[:success] = "Ton compte a été créé!"
      redirect_to :root
    else
      flash[:danger] = "Ton compte n'est pas valide !"
      render new_user_path
    end
  end
  def show
    @author = User.find(params[:id])
  end
end
