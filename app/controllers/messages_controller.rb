class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.send
      flash.now[:success] = "Your message has been sent"
      render template: "static/contact"
    else
      flash.now[:danger] = @message.errors.full_messages.to_sentence
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :phone_number, :body)
    end
end
