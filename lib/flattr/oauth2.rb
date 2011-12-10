module Flattr
  module OAuth2

    def authorize_path(opts = {})

      default_options = {
        :client_id => client_id,
        :client_secret => client_secret,
        :response_type => "code"
      }

      opts = default_options.merge(opts)

      if !opts[:scope].nil?
        if opts[:scope].is_a?(Array)
          opts[:scope] = opts[:scope].join(",")
        end
      end

      query_string = %w(response_type client_id redirect_uri scope state).collect do |key|
        "#{key.to_s}=#{opts[key.to_sym]}" if opts[key.to_sym]
      end.compact.join("&")

      "#{authorize_endpoint}/?#{query_string}"
    end

    def get_access_token(code)
      post(token_endpoint, {:code => code, :grant_type => 'authorization_code'}, options)
    end

  end
end
