module Flattr
  module OAuth2

    def authorize_url(opts = {})

      default_options = {
        :client_id => client_id.strip,
        :client_secret => client_secret.strip,
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
      response = post(token_endpoint, {
        :code => code.strip,
        :grant_type => 'authorization_code'
      },{
        :headers => {
          :authorization => "Basic #{Flattr::Client.base64_encode("#{client_id}:#{client_secret}")}"
        }}
      )
      self.access_token = response['access_token']
      access_token
    end

  end
end
