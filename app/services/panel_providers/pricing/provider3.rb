module PanelProviders
  module Pricing
    class Provider3
      def run
        # The price should be based on how many html nodes can you find on this site http://time.com divided by 100
        count(response) / 100
      end

      private

      def count(root)
        1 + root.children.map { |child| count(child) }.sum
      end

      def response
        @response ||=
          begin
            response = Net::HTTP.get_response(URI.parse(url))
            Nokogiri::XML(response.body).root
          end
      end

      def url
        @url ||= 'http://time.com'
      end
    end
  end
end
