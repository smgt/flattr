
module Flattr
  class Client
    module Flattrs

      # Public: Flattr a thing
      #
      # id - id of the thing you wan't to flattr
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.flattr(450287)
      #   # => true
      #
      # Returns a true if successful
      # Raises Flattr::Error::Forbidden if your are not allowed to flattr the thing
      # Raises Flattr::Error::NotFound if no thing were found
      def flattr(thing_id)
        flattr = post("/rest/v2/things/#{thing_id}/flattr")
        return true
      end

    end
  end
end
