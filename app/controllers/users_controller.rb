class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)', "%#{search_params}%").order('name ASC')
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  private
  def search_params
    params[:name]
  end

  def name_js(user)
    hash = { name: @users.name }
  end

end
