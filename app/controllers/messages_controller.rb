class MessagesController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end


private

  def message_params
    params.require(:message).permit(:photo_name, :photo_message,images: []).merge(user_id: current_user.id)
  end

end
