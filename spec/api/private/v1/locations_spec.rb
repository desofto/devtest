require 'rails_helper'

describe API::Private::V1::Locations, type: :api do
  let(:user) { create(:user) }

  describe 'GET /api/private/v1/locations/:country_code' do
    it 'returns clients with pagination' do
      get "/api/private/v1/locations/123?auth_token=#{user.auth_token}"

      expect(response.status).to eq 200
    end
  end
end
