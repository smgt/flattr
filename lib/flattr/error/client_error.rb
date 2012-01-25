require 'flattr/error'

module Flattr
  # Raised when Flattr returns a 4xx HTTP status code
  class Error::ClientError < Flattr::Error
  end
end
