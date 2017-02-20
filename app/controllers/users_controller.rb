class UsersController < ApplicationController
  def show
    flash[:notice] = hello
  end
end
