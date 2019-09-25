class StaticController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.send
        @message = Message.new
        format.html { redirect_to :index }
        format.js   { flash.now[:success] = "Message sent. Thank you!"}
      else
        format.html { redirect_to :index }
        format.js   { flash.now[:danger] = "Messaged failed. Please check your fields."}
      end
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :phone_number, :body)
    end
end
