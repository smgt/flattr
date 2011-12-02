require "flattr/version"
require "flattr/client"
require "flattr/config"

module Flattr
  extend Config
  class << self

    def new(options={})
      Flattr::Client.new(options)
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
