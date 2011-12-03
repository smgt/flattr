require 'faraday'
require 'flattr/response/parse_json'

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
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        # builder.use Twitter::Request::Gateway, gateway if gateway
        # builder.use Twitter::Response::RaiseClientError
        builder.use Flattr::Response::ParseJson unless options[:raw]
        # builder.use Twitter::Response::RaiseServerError
        builder.adapter(adapter)
      end
    end
  end
end

