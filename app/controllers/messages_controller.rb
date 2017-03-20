class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end

  def create
    message = Message.new(message_params)
    if message.save
      group = Group.find(params[:group_id])
      redirect_to group_messages_path(group)
    else
      group = Group.find(params[:group_id])
      redirect_to group_messages_path(group), alert: "値が入力されていません"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
