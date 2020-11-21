class MessagesController < ApplicationController
before_action :authenticate_user!, except: [:index,:show]

  def index
    @messages = Message.order(created_at: :desc)
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

  def show
    @message = Message.find(params[:id])
  end


private

  def message_params
    params.require(:message).permit(:photo_name, :photo_message,images: []).merge(user_id: current_user.id)
  end

end
