require 'flattr/base'

module Flattr
  class Search < Flattr::Base

    lazy_attr_reader :total_items, :items, :page, :things

    def initialize(attrs={})
      if attrs["items"] > 0
        items = []
        attrs["things"].each do |item|
          items << Flattr::Thing.new(item)
        end
        attrs["things"] = items
      end
      super attrs
    end

   end
end
