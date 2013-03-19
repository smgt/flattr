require 'flattr/config'
require 'flattr/connection'
require 'flattr/request'
require 'flattr/user'
require 'flattr/thing'
require 'flattr/search'
require 'flattr/language'
require 'flattr/category'
require 'flattr/version'
require 'flattr/oauth2'
require 'flattr/authenticatable'

module Flattr
  class Client
    require 'flattr/client/users'
    require 'flattr/client/things'
    require 'flattr/client/languages'
    require 'flattr/client/categories'
    require 'flattr/client/subscriptions'
    require 'flattr/client/flattrs'

    include Flattr::Connection
    include Flattr::Request

    include Flattr::Authenticatable
    include Flattr::OAuth2

    include Flattr::Client::Users
    include Flattr::Client::Things
    include Flattr::Client::Languages
    include Flattr::Client::Categories
    include Flattr::Client::Subscriptions
    include Flattr::Client::Flattrs

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
      @current_user ||= self.user
    end

    def self.base64_encode str
      [str].pack("m9999").chomp
    end

  end
end
