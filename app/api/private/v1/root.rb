# frozen_string_literal: true
module API
  module Private
    module V1
      class Root < Grape::API
        include API::Private::Exceptions

        helpers do
          def authenticate!
            authentication_token && current_user.present?
          end

          def current_user
            @current_user ||= authentication_token && ::User.find_by(auth_token: authentication_token)
          end

          private

          def authentication_token
            @api_token ||= params[:auth_token]
          end
        end

        before do
          authenticate!
        end

        version 'v1', using: :path
        format :json

        mount API::Private::V1::Locations
        mount API::Private::V1::TargetGroups
        mount API::Private::V1::EvaluateTarget
      end
    end
  end
end
