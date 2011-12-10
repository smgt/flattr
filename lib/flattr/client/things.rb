require 'flattr/thing'

module Flattr
  class Client
    module Things

      def thing(id)
        thing = get("/rest/v2/things/#{id}")
        Flattr::Thing.new(thing)
      end

      def thing_new(url, opts = {})
        response = post("/rest/v2/things", opts.merge(:url => url))
        thing = get("/rest/v2/things/#{response[:id]}") 
        Flattr::Thing.new(thing)
      end

      def thing_update(id, opts = {})
        patch("/rest/v2/things/#{id}", opts)
        thing = get("/rest/v2/things/#{id}")
        Flattr::Thing.new(thing)
      end

      def thing_delete(id)
        thing = delete("/rest/v2/things/#{id}")
        true
      end

      def search(query = {})
        result = get("/rest/v2/things/search")
        result
      end

      def lookup(url)
        thing = get("/rest/v2/things/lookup/?q=#{url}")
        Flattr::Thing.new(thing)
      end

    end
  end
end
