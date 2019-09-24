class StaticController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.send
      @message = Message.new
      format.html { render :index }
      format.js   { flash.now[:success] = "Message sent. Thank you!" }
    else
      format.html { render :index }
      format.js   { flash.now[:danger] = @message.errors.full_messages.to_sentence }
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :phone_number, :body)
    end
end
