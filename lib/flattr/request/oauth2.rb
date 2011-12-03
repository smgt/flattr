module Flattr
  module Request
    class FlattrOAuth2 < Faraday::Middleware

      include Flattr::Config

      def call(env)
        env[:request_headers]['Authorization'] = authorization_header
        @app.call(env)
      end

      def initialize(app, options)
        @app, @options = app, options
      end

      def authorization_header
        if @options.access_token
          "Bearer #{@options.access_token}"
        else
          "Basic #{["#{@options.client_id}:#{@options.client_secret}"].pack("m")}"
        end
      end
    end
  end
end
