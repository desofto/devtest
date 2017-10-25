# frozen_string_literal: true
module API
  module Public
    module V1
      class Root < Grape::API
        include API::Public::Exceptions

        version 'v1', using: :path
        format :json

        helpers API::Helpers::Common

        mount API::Public::V1::Auth
        mount API::Public::V1::Locations
        mount API::Public::V1::TargetGroups
      end
    end
  end
end
