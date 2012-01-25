require 'flattr/error/client_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 401
  class Error::Unauthorized < Flattr::Error::ClientError
  end
end
