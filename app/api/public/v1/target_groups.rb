require 'net/http'

module API
  module Public
    module V1
      class TargetGroups < Grape::API
        resource :target_groups do
          desc 'Methods related to particular target group'
          route_param :country_code do
            get do
            end
          end
        end
      end
    end
  end
end
