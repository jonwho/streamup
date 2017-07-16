class HomeController < ApplicationController
  def show
    if current_user
      @message = Message.new
    end
  end

  def about
  end
end
