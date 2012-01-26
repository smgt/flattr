require 'flattr/thing'

module Flattr
  class Client
    module Things

      # Public: Fetch a thing
      #
      # id - id of the thing you would like to fetch
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.thing(450287)
      #   #=> Flattr::Thing
      #
      # Returns the thing
      # Raises Flattr::Error::NotFound on error
      def thing(id)
        thing = get("/rest/v2/things/#{id}")
        Flattr::Thing.new(thing)
      end

      # Public: Create a thing
      #
      # url - URL you want to submit
      # opts - A Hash containing the thing attribtues (default: {})
      #        :title - title of the thing (optional).
      #        :description - description of the thing (optional).
      #        :category - category of the thing (optional).
      #        :language - language of the thing (optional).
      #        :tags - tags of the thing (optional).
      #        :hidden - boolean toggling if thing should be hidden or not (optional).
      #
      # Returns new thing
      # Raises Flattr::Error::BadRequest on validation error
      # Raises Flattr::Error::NotFound if thing was not found
      def thing_new(url, opts = {})
        response = post("/rest/v2/things", opts.merge(:url => url))
        thing = get("/rest/v2/things/#{response[:id]}")
        Flattr::Thing.new(thing)
      end

      # Public: Update a thing
      #
      # id - id of the thing to update
      # opts - a Hash containing the attributes to update (default: {})
      #        :title - title of the thing (optional).
      #        :description - description of the thing (optional).
      #        :category - category of the thing (optional).
      #        :language - language of the thing (optional).
      #        :tags - tags of the thing (optional).
      #        :hidden - boolean toggling if thing should be hidden or not (optional).
      #
      # Returns updated thing
      # Raises Flattr::Error::BadRequest on validation error
      # Raises Flattr::Error::NotFound if thing was not found
      def thing_update(id, opts = {})
        patch("/rest/v2/things/#{id}", opts)
        thing = get("/rest/v2/things/#{id}")
        Flattr::Thing.new(thing)
      end

      # Public: Delete a thing
      #
      # id - id of the thing you want to delete
      #
      # Example
      #
      #   f = Flattr.new
      #   f.thing_delete(1)
      #   # => true
      #
      # Returns true if successful
      # Raises Flattr::Error::NotFound if thing was not found
      def thing_delete(id)
        thing = delete("/rest/v2/things/#{id}")
        if thing.nil? || thing == ""
          return true
        else
          return false
        end
      end

      # Public: Search things
      #
      # params - The Hash options used to configure search (default: {})
      #          :query - A free text search query (optional).
      #          :language - Filter by language (optional).
      #          :category - Filter by category (optional).
      #          :user - Search only a users things (optional).
      #          :tags - Filter by tags (optional).
      #          :page - Show page (optional).
      #          :count - How many items per page (optional).
      #
      # Examples
      #
      #   # Return a search result containgin 'smgt'
      #   f = Flattr.new
      #   f.things_search(:query => "smgt")
      #
      #   # Return a search result containing 'ruby' from user 'smgt'
      #   f = Flattr.new
      #   f.things_search(:query => "ruby", :user => 'smgt')
      #
      # Returns Flattr::Search
      def thing_search(params = {})
        result = get("/rest/v2/things/search", params)
        Flattr::Search.new(result)
      end

      # Public: Check if a URL is registred as a thing
      #
      # url - URL to lookup
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.things_lookup("http://flattr.com")
      #   # => nil
      #
      #   f = Flattr.new
      #   f.things_lookup("http://github.com/simon/flattr")
      #   # => Flattr::Thing
      #
      # Returns Flattr::Thing on success and nil on failure
      def thing_lookup(url)
        lookup = get("/rest/v2/things/lookup", {:url => url})
        if lookup["location"]
          thing = get(lookup['location'])
          Flattr::Thing.new(thing)
        else
          nil
        end
      end

    end
  end
end
