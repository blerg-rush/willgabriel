class StaticController < ApplicationController
  def index
    @message = Message.new
  end

  def about; end
end
