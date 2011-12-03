require 'flattr/user'

module Flattr
  class Client
    module Users

      def user(username=nil)
        user = username || self.current_user.username
        user = get("/rest/v2/users/#{user}")
        Flattr::User.new(user)
      end

    end
  end
end

