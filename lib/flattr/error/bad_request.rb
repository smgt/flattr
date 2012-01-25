require 'flattr/error/client_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 400
  class Error::BadRequest < Flattr::Error::ClientError
  end
end
