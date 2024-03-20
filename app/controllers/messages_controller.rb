class MessagesController < ApplicationController
  def index
    @message = Massage.new
    @room = Room.find(params[:room_id])
  end


  def create
    @room = Room.find(params[:room_id])
    @message = aroom.messages.new(message_params)
    if @message.save
    redirecto_to room_messages_path(@room)
    else
      render :index, status: unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
