module Flattr
  module Request
    class FlattrOAuth2 < Faraday::Middleware

      def call(env)
        if authorization_header
          env[:request_headers]['Authorization'] = authorization_header
        end
        @app.call(env)
      end

      def initialize(app, options)
        @app, @options = app, options
      end

      def authorization_header
        if @options[:access_token]
          "Bearer #{@options[:access_token]}"
        elsif @options[:client_id] && @options[:client_secret]
          "Basic #{base64_encode("#{@options[:client_id]}:#{@options[:client_secret]}")}"
        else
          nil
        end
      end

    end
  end
end
