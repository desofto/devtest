# frozen_string_literal: true
module API
  module Public
    class Root < Grape::API
      mount API::Public::V1::Root
    end
  end
end
