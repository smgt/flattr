module Flattr
  module OAuth2

    def authorize_path opts = {}
      opts = options.merge(opts)
      url_params = "response_type=code"
      url_params = "#{url_params}&client_id=#{opts[:client_id]}"
      url_params = "#{url_params}&redirect_uri=#{opts[:redirect_uri]}" if opts.keys.include?(:redirect_uri)
      url_params = "#{url_params}&scope=#{opts[:scopes].join(",")}" if opts.keys.include?(:scopes)
      "#{opts[:authorize_endpoint]}/?#{url_params}"
    end

    def get_access_token code
      post(token_endpoint, {:code => code, :grant_type => 'authorization_code'}, options)
    end

  end
end
