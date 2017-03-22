class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end

  def create
    message = Message.new(create_params)
    if message.save
      group = Group.find(params[:group_id])
      redirect_to group_messages_path(group)
    elsif
      group = Group.find(params[:group_id])
      flash[:alert] = message.errors.full_messages.join(',')
      redirect_to group_messages_path(group)
    end
  end

  private
  def create_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
