class HomeController < ApplicationController
  before_action :get_messages, only: [:show]

  def show
  end

  def about
  end

  private

  def get_messages
    @messages = Message.for_display
    @message = current_user.messages.build if current_user
  end
end
