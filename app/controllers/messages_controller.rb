class MessagesController < ApplicationController

  def index
    @groups   = current_user.groups
    @group    = Group.find(params[:group_id])
    @message  = Message.new
    @messages = @group.messages
    @users    = @group.users
    respond_to do |format|
      format.html
      format.json { render json: auto_params }
    end
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.json { render json: message_js(@message) }
      end
    else
      redirect_to group_messages_path(find_params), alert: "メッセージを入力してください"
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

  def auto_params
    new_messages = Message.where("id > #{params[:message_id]}", group_id: params[:group_id]).where.not(user_id: current_user.id).map{ |new_message| message_js(new_message)}
    return new_messages
  end
end
