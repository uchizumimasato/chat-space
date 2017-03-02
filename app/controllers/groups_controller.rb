class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to "/groups"
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
