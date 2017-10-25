module API
  module Helpers
    module Common
      def authenticate!
        authentication_token && current_user.present?
      end

      def current_user
        @current_user ||= authentication_token && ::User.find_by(auth_token: authentication_token)
      end

      def declared_params
        declared(params, include_missing: false)
      end

      private

      def authentication_token
        @api_token ||= params[:auth_token]
      end
    end
  end
end
