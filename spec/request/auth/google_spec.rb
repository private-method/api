# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication via Google', type: :request do
  context 'with valid params' do
    it 'returns jwt_token and creates new user' do
      post '/api/v1/auth/google', params: {
        email: 'sample@email.com',
        avatar_url: 'http://avatar.url'
      }

      expect(json_response['jwt_token']).to be_present
      expect(User.all.count).to eq 1
    end

    it 'returns jwt_token and not creates new user' do
      User.create(email: 'sample@email.com', avatar_url: 'http://image.com')
      post '/api/v1/auth/google', params: {
        email: 'sample@email.com',
        avatar_url: 'http://image.com'
      }
      expect(json_response['jwt_token']).to be_present
      expect(User.all.count).to eq 1
    end

    it 'returns jwt_token and not creates new user when avatar updated' do
      User.create(email: 'sample@email.com', avatar_url: 'http://image.com')
      post '/api/v1/auth/google', params: {
        email: 'sample@email.com',
        avatar_url: 'http://updated-image.com'
      }
      expect(json_response['jwt_token']).to be_present
      expect(User.all.count).to eq 1
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
