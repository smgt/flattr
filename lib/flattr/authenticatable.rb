module Flattr
  module Authenticatable
    # Credentials hash
    #
    # @return [Hash]
    def credentials
      {
        :client_id     => client_id,
        :client_secret => client_secret,
        :access_token  => access_token,
      }
    end

    # Check whether credentials are present
    #
    # @return [Boolean]
    def credentials?
      if credentials[:access_token]
        true
      elsif credentials[:client_id] && credentials[:client_secret]
        true
      else
        false
      end
    end
  end
end
