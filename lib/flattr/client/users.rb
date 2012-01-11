require 'flattr/user'

module Flattr
  class Client
    module Users

      def user(username=nil)
        user = username || self.current_user.username
        user = get("/rest/v2/users/#{user}")
        Flattr::User.new(user)
      end

      def user_things(username=nil, args={})
        user = username || self.current_user.username
        get("/rest/v2/users/#{user}/things", args).map do |thing|
          Flattr::Thing.new(thing)
        end
      end

      def user_flattrs(username=nil, args={})
        user = username || self.current_user.username
        get("/rest/v2/users/#{user}/flattrs").map do |flattr|
          flattr
        end
      end

    end
  end
end

