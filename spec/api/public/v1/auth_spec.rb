require 'rails_helper'

describe API::Public::V1::Auth, type: :api do
  let(:user) { create(:user) }

  describe 'POST /api/public/v1/sign_in' do
    it 'returns token' do
      post '/api/public/v1/sign_in', params: { email: user.email, password: user.password }

      expect(response.status).to eq 201
      expect(json).to eq user.reload.auth_token
    end

    it 'does not block account after 4 failed attempts' do
      4.times do
        post '/api/public/v1/sign_in', params: { email: user.email, password: 'wrong_password' }
        expect(response.status).to eq 401
      end

      post '/api/public/v1/sign_in', params: { email: user.email, password: user.password }

      expect(response.status).to eq 201
      expect(json).to eq user.reload.auth_token
    end

    it 'blocks account after 5 failed attempts' do
      5.times do
        post '/api/public/v1/sign_in', params: { email: user.email, password: 'wrong_password' }
        expect(response.status).to eq 401
      end

      post '/api/public/v1/sign_in', params: { email: user.email, password: user.password }

      expect(response.status).to eq 401
    end
  end
end
