module Flattr
  class Client
    module Subscriptions
      def subscribe thing_id
        response = post("/rest/v2/things/#{thing_id}/subscriptions")
        response['message'] == "ok"
      end

      def unsubscribe thing_id
        delete("/rest/v2/things/#{thing_id}/subscriptions")
        true
      end

      def subscription_toggle thing_id
        response = put("/rest/v2/things/#{thing_id}/subscriptions")
        response['message'] == "started"
      end
    end
  end
end
