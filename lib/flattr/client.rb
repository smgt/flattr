require 'flattr/config'
require 'flattr/connection'
require 'flattr/request'
require 'flattr/user'
require 'flattr/version'

module Flattr
  class Client
    require 'flattr/client/users'

    include Flattr::Connection
    include Flattr::Request

    include Flattr::Client::Users

    attr_accessor *Config::VALID_OPTIONS_KEYS

     # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [Flattr::Client]
    def initialize(attrs={})
      attrs = Flattr.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

    # Returns the configured name or the name of the authenticated user
    #
    # @return [Flattr::User]
    def current_user
      @current_user ||= Flattr::User.new(self.verify_credentials)
    end

  end
end
