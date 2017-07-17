module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # WebSocket cant read from session middleware variable
    # but it can read cookies from client
    # should add token auth

    #include SessionsHelper

    #identified_by :message_user

    # use this method when you want to add authorization for connecting to ActionCable
    #def connect
      #self.message_user = find_verified_user
    #end

    #private

    #def find_verified_user
      #if logged_in?
        #current_user
      #else
        ## helper method given by rails
        #reject_unauthorized_connection
      #end
    #end
  end
end
