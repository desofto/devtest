require 'net/http'

module API
  module Public
    module V1
      class TargetGroups < Grape::API
        resource :target_groups do
          desc 'Methods related to particular target group'
          route_param :country_code do
            get do
              TargetGroupsService.new(country_code: declared_params.country_code).run
            end
          end
        end
      end
    end
  end
end
