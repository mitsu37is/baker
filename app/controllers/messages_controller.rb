class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      flash[:notice] = "メッセージを送ってくださりありがとうございます。改善に役立てます。"
      redirect_to root_path
    else
      flash[:notice] = "内容を記入してください。"
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:account, :body)
  end
end
