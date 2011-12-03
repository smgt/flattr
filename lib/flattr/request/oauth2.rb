module Flattr
  module Request
    class FlattrOAuth2 < Faraday::Middleware

      def call(env)
        env[:request_headers]['Authorization'] = authorization_header
        @app.call(env)
      end

      def initialize(app, options)
        @app, @options = app, options
      end

      def authorization_header
        if @options[:access_token]
          "Bearer #{@options[:access_token]}"
        else
          "Basic #{base64_encode("#{@options[:client_id]}:#{@options[:client_secret]}")}"
        end
      end

      def base64_encode str
        [str].pack("m9999").chomp
      end

    end
  end
end
