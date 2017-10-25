require 'net/http'

module API
  module Private
    module V1
      class EvaluateTarget < Grape::API
        resource :evaluate_target do
          desc ''
          params do
            requires :country_code, type: String
            requires :target_group_id, type: Integer
            requires :locations, type: Array do
              requires :id, type: Integer
              requires :panel_size, type: Integer
            end
          end
          post do
            EvaluateTargetService.new(
              country_code: declared_params.country_code,
              target_group_id: declared_params.target_group_id,
              locations: declared_params.locations
            ).run
          end
        end
      end
    end
  end
end
