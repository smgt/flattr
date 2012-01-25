require 'flattr/error/server_error'

module Flattr
  # Raised when Flattr returns the HTTP status code 500
  class Error::InternalServerError < Flattr::Error::ServerError
  end
end
