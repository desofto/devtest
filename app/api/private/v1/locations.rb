require 'net/http'

module API
  module Private
    module V1
      class Locations < Grape::API
        resource :locations do
          desc 'Methods related to particular location'
          route_param :country_code do
            params do
              requires :country_code, type: String
            end
            get do
              present LocationsService.new(country_code: declared_params[:country_code]).run, with: API::Private::V1::Entities::Location
            end
          end
        end
      end
    end
  end
end
