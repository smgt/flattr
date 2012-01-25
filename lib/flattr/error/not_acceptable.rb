require 'flattr/error/client_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 406
  class Error::NotAcceptable <Flattr::Error::ClientError
  end
end
