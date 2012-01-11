require 'flattr/language'

module Flattr
  class Client
    module Languages

      # Public: Returns available languages on flattr
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.languages
      #   # => [Flattr::Language]
      #
      # Returns a Array with Flattr::Language inside
      def languages
        get("/rest/v2/languages").map do |language|
          Flattr::Language.new(language)
        end
      end

    end
  end
end
