class GroupsController < ApplicationController
  before_action :redirect

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to groups_path
  end

  private

  def redirect
    redirect_to new_user_session_path unless user_signed_in?
  end

  def group_params
    params.require(:group).permit(:name, {user_ids:[]})
  end
end
