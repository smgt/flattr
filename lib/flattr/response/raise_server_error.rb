require 'faraday'
require 'flattr/error/bad_gateway'
require 'flattr/error/internal_server_error'

module Flattr
  module Response
    class RaiseServerError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status].to_i
        when 500
          raise Flattr::Error::InternalServerError.new("Something is technically wrong.", env[:response_headers])
        when 502
          raise Flattr::Error::BadGateway.new("Flattr is down or being upgraded.", env[:response_headers])
        end
      end

    end
  end
end
