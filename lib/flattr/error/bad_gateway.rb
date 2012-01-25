require 'flattr/error/server_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 502
  class Error::BadGateway < Flattr::Error::ServerError
  end
end
