class UsersController < ApplicationController
  def show
    username = params[:username]
    @username = username.split('-').join(' ')
    user = User.find_by_username(@username)
    @messages = if user
                  user.messages
                else
                  []
                end
  end
end
