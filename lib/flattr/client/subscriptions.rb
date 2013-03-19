module Flattr
  class Client
    module Subscriptions
      def subscribe id
        response = post("/rest/v2/things/#{id}/subscriptions")
        response['message'] == "ok"
      end
    end
  end
end
