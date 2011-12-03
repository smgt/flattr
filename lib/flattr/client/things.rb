require 'flattr/thing'

module Flattr
  class Client
    module Things

      def thing(id)
        thing = get("/rest/v2/things/#{id}")
        Flattr::Thing.new(thing)
      end

      def lookup(url)
        thing = get("/rest/v2/things/lookup/?q=#{url}")
        Flattr::Thing.new(thing)
      end

    end
  end
end
