require 'flattr/category'

module Flattr
  class Client
    module Categories

      def categories
        @categories ||= get('/rest/v2/categories').map do |category|
          Flattr::Category.new(category)
        end
      end

      def category(id)
        categories.select do |category|
          category.id == id
        end.first
      end


    end
  end
end
