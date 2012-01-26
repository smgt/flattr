
module Flattr
  class Client
    module Flattrs

      # Public: Flattr a thing
      #
      # thing  - The id or URL of the thing you wan't to flattr
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.flattr(450287)
      #   # => true
      #
      #   f = Flattr.new
      #   f.flattr('https://github.com/simon/flattr')
      #   # => true
      #
      # Returns a true if successful
      # Raises Flattr::Error::Forbidden if your are not allowed to flattr the thing
      # Raises Flattr::Error::NotFound if no thing were found
      def flattr(thing)
        if thing.is_a?(Fixnum) || !thing.match(/^\d+$/).nil?
          flattr = post("/rest/v2/things/#{thing}/flattr")
        else
          flattr = post("/rest/v2/flattr", {:url => thing})
        end
        return true
      end

    end
  end
end
