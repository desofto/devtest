require 'net/http'

module PanelProviders
  module Pricing
    class Provider1
      def run
        # The price should be based on how many letters "a" can you find on this site http://time.com divided by 100
        response.count('a') / 100
      end

      private

      def response
        @response ||=
          begin
            response = Net::HTTP.get_response(URI.parse(url))
            response.body
          end
      end

      def url
        @url ||= 'http://time.com'
      end
    end
  end
end
