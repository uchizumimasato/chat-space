class UsersController < ApplicationController

  def search
    @users = User.users params[:name]
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  private
  def search_params
    params[:name]
  end

end
