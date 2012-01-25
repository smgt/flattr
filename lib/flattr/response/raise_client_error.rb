require 'faraday'
require 'flattr/error/bad_request'
require 'flattr/error/forbidden'
require 'flattr/error/not_acceptable'
require 'flattr/error/not_found'
require 'flattr/error/unauthorized'

module Flattr
  module Response
    class RaiseClientError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status].to_i
        when 400
          raise Flattr::Error::BadRequest.new(error_body(env[:body]), env[:response_headers])
        when 401
          raise Flattr::Error::Unauthorized.new(error_body(env[:body]), env[:response_headers])
        when 403
          raise Flattr::Error::Forbidden.new(error_body(env[:body]), env[:response_headers])
        when 404
          raise Flattr::Error::NotFound.new(error_body(env[:body]), env[:response_headers])
        when 406
          raise Flattr::Error::NotAcceptable.new(error_body(env[:body]), env[:response_headers])
        end
      end

    private

      def error_body(body)
        if body.nil?
          ''
        elsif body['error']
          body['error_description']
        end
      end

    end
  end
end
