require 'flattr/category'

module Flattr
  class Client
    module Categories

      # Public: Get a list of available categories
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.categories
      #   # => [Flattr::Category]
      #
      # Returns a Array with Flattr::Category inside
      def categories
        @categories ||= get('/rest/v2/categories').map do |category|
          Flattr::Category.new(category)
        end
      end

      # Public: Get a category by id
      #
      # id - id of the catgory
      #
      # Examples
      #
      #   f = Flattr.new
      #   f.category("software")
      #   # => Flattr::Category
      #
      # Returns a Flattr::Category on success and nil on failure
      def category(id)
        categories.select do |category|
          category.id == id
        end.first
      end


    end
  end
end
