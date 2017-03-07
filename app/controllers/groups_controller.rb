class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      Group.create(group_params)
      redirect_to action: :index
    else
      
    end
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
  def group_params
    params.require(:group).permit(:name, {user_ids:[]})
  end
end
