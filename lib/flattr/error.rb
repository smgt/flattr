module Flattr
  # Custom error class for rescuing from all Flattr errors
  class Error < StandardError
    attr_reader :http_headers

    # Initializes a new Error object
    #
    # @param message [String]
    # @param http_headers [Hash]
    # @return [Flattr::Error]
    def initialize(message, http_headers)
      @http_headers = Hash[http_headers]
      super(message)
    end

    # @return [Integer]
    def ratelimit_limit
      @http_headers.values_at('x-ratelimit-limit', 'X-RateLimit-Limit').detect{|value| value}.to_i
    end

    # @return [Integer]
    def ratelimit_remaining
      @http_headers.values_at('x-ratelimit-remaining', 'X-RateLimit-Remaining').detect{|value| value}.to_i
    end

  end
end
