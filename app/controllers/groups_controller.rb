class GroupsController < ApplicationController
  before_action :authenticate_user!, alert: "ログインしてください"
  before_action :find_group, only:[:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = []
    @users << current_user
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to groups_path, notice: "グループが作成されました。"
    elsif group.name.empty?
      flash[:alert] = group.errors.full_messages.join('.')
      redirect_to new_group_path
    elsif group.group_users.empty?
      redirect_to new_group_path, alert: "メンバーがいません。"
    end
  end

  def edit
    @group.users << current_user
    @users = @group.users
  end

  def update
    @group.update(group_params)
    redirect_to groups_path, notice: "グループが更新されました。"
  end

  private

  def group_params
    params.require(:group).permit(:name, {user_ids:[]})
  end

  def find_group
    @group = Group.find(params[:id])
  end

end
