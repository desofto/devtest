require 'net/http'

module API
  module Private
    module V1
      class Locations < Grape::API
        resource :locations do
          desc 'Methods related to particular location'
          route_param :country_code do
            get do
            end
          end
        end
      end
    end
  end
end
