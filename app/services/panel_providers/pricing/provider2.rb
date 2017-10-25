module PanelProviders
  module Pricing
    class Provider2
      def run
        # The price should be based on how many arrays with more than 10 elements you can find in this search result
        # http://openlibrary.org/search.json?q=the+lord+of+the+rings
        @hits = 0

        count(response)

        @hits
      end

      private

      def found!
        @hits += 1
      end

      def count(root)
        case root
        when Array
          found! if root.count > 10
          root.each do |item|
            count(item)
          end
        when Hash
          root.each do |key, item|
            count(item)
          end
        end
      end

      def response
        @response ||=
          begin
            response = Net::HTTP.get_response(URI.parse(url))
            JSON.parse(response.body)
          end
      end

      def url
        @url ||= 'http://openlibrary.org/search.json?q=the+lord+of+the+rings'
      end
    end
  end
end
