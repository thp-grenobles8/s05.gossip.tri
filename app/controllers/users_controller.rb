class UsersController < ApplicationController

  def show
    @author = User.find(params[:id])
  end
end
