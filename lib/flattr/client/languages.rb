require 'flattr/language'

module Flattr
  class Client
    module Languages

      def languages
        get("/rest/v2/languages").map do |language|
          Flattr::Language.new(language)
        end
      end

    end
  end
end
