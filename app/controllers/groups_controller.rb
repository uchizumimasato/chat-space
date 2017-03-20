class GroupsController < ApplicationController
  before_action :authenticate_user!, alert: "ログインしてください"

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to groups_path, notice: "グループが作成されました"
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to groups_path, notice: "グループが更新されました"
  end

  def group_params
    params.require(:group).permit(:name, {user_ids:[]})
  end
end
