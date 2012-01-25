require 'flattr/error/client_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 404
  class Error::NotFound < Flattr::Error::ClientError
  end
end
