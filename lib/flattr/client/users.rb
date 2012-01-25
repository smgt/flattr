require 'flattr/user'

module Flattr
  class Client
    module Users

      # Public: Get a user or the one currently authenticated
      #
      # username - username of the user you want to get (optional)
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.user("smgt")
      #   # => #<Flattr::User...
      #
      # Returns a Flattr::User if successful
      # Raises a ERROR on failure
      def user(username=nil)
        if username.nil?
          user = get("/rest/v2/user")
        else
          user = get("/rest/v2/users/#{username}")
        end
        Flattr::User.new(user)
      end

      # Public: Get a users things
      #
      # username - username of the user you want to get (optional)
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.user_things("smgt")
      #   # => [#<Flattr::Thing...
      #
      # Returns a Array with Flattr::User's inside if successful
      # Raises a ERROR on failure
      def user_things(username=nil, args={})
        user = username || self.current_user.username
        get("/rest/v2/users/#{user}/things", args).map do |thing|
          Flattr::Thing.new(thing)
        end
      end

      # Public: Get a users flattrs
      #
      # username - username of the user you want to get (optional)
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.user_flattrs("smgt")
      #   # => [{"type" => "flattr"....
      #
      # Returns a Array with flattrs if successful
      # Raises a ERROR on failure
      def user_flattrs(username=nil, args={})
        user = username || self.current_user.username
        get("/rest/v2/users/#{user}/flattrs").map do |flattr|
          flattr
        end
      end

    end
  end
end

