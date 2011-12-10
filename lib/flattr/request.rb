module Flattr
  # Defines HTTP request methods
  module Request
    # Perform an HTTP DELETE request
    def delete(path, params={}, options={})
      request(:delete, path, params, options)
    end

    # Perform an HTTP GET request
    def get(path, params={}, options={})
      request(:get, path, params, options)
    end

    # Perform an HTTP POST request
    def post(path, params={}, options={})
      request(:post, path, params, options)
    end

    # Perform an HTTP PUT request
    def put(path, params={}, options={})
      request(:put, path, params, options)
    end

    # Perform an HTTP PATCH request
    def patch(path, params={}, options={})
      request(:patch, path, params, options)
    end
  private

    # Perform an HTTP request
    def request(method, path, params, options)
      response = connection(options).send(method) do |request|
        case method.to_sym
        when :get, :delete
          request.url(path, params)
        when :post, :put, :patch
          request.path = path
          request.body = params unless params.empty?
        end
      end
      options[:raw] ? response : response.body
    end

  end
end

