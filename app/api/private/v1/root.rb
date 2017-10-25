# frozen_string_literal: true
module API
  module Private
    module V1
      class Root < Grape::API
        include API::Private::Exceptions

        version 'v1', using: :path
        format :json

        helpers API::Helpers::Common

        before do
          authenticate!
        end

        mount API::Private::V1::Locations
        mount API::Private::V1::TargetGroups
        mount API::Private::V1::EvaluateTarget
      end
    end
  end
end
