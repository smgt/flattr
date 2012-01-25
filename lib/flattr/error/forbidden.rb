require 'flattr/error/client_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 403
  class Error::Forbidden < Flattr::Error::ClientError
  end
end
