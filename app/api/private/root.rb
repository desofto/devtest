# frozen_string_literal: true
module API
  module Private
    class Root < Grape::API
      mount API::Private::V1::Root
    end
  end
end
