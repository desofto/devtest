require 'rails_helper'

describe API::Private::V1::Locations, type: :api do
  let(:user) { create(:user) }

  describe 'GET /api/private/v1/locations/:country_code' do
    it "returns locations which belong to the selected country based on it's current panel provider" do
      get "/api/private/v1/locations/en?auth_token=#{user.auth_token}"

      expect(response.status).to eq 200
      expect(json).to eq []
    end
  end
end
