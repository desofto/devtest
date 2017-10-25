require 'net/http'

module API
  module Public
    module V1
      class Locations < Grape::API
        resource :locations do
          desc 'Methods related to particular location'
          route_param :country_code do
            get do
              LocationsService.new(country_code: declared_params.country_code).run
            end
          end
        end
      end
    end
  end
end
