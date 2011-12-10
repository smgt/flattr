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
      !credentials[:access_token].nil?
    end
  end
end
