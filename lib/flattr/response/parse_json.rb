require 'faraday'
require 'multi_json'

module Flattr
  module Response
    class ParseJson < Faraday::Response::Middleware

      def parse(body)
        case body
        when ''
          nil
        when 'true'
          true
        when 'false'
          false
        else
          begin
            ::MultiJson.load(body)
          rescue
            nil
          end
        end
      end

    end
  end
end
