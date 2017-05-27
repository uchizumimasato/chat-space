class MessagesController < ApplicationController

  def index
    @groups   = current_user.groups
    @group    = Group.find(params[:group_id])
    @message  = Message.new
    @messages = @group.messages
    @users    = @group.users
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.json { render json: message_js(@message) }
      end
    else
      flash[:alert] = @message.errors.full_messages.join(',')
      redirect_to group_messages_path(find_params)
    end
  end

  private

  def create_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def message_js(message)
    hash = { name: message.user.name, created_at: message.created_at.strftime("%Y年%m月%d日 %H:%M:%S"), body: message.body, id: message.id, image: message.image.url }
  end

  def find_params
    Group.find(params[:group_id])
  end
end
