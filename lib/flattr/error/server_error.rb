require 'flattr/error'

module Flattr 
  # Raised when Flattr returns a 5xx HTTP status code
  class Error::ServerError < Flattr::Error
  end
end
