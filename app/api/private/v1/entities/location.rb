module API
  module Private
    module V1
      module Entities
        class Location < Base
          expose :name
          expose :external_id
          expose :secret_code
        end
      end
    end
  end
end
