require 'faraday'
require 'flattr/core_ext/hash'
require 'flattr/response/parse_json'
require 'flattr/request/oauth2'

module Flattr
  module Connection
  private
    def connection(options={})
      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => user_agent,
        },
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => options.fetch(:endpoint, endpoint),
      }
      Faraday.new(default_options.deep_merge(connection_options)) do |builder|
        #builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::JSON
        builder.use Faraday::Request::UrlEncoded
        builder.use Flattr::Request::FlattrOAuth2, options
        builder.use Flattr::Response::ParseJson unless options[:raw]
        builder.adapter(adapter)
      end
    end
  end
end

