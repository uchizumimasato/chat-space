class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
  end
end
