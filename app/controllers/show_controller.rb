class ShowController < ApplicationController
  def authors
    @author = User.find(params[:author_id].to_i)
  end
end
