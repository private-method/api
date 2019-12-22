# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JwtEncode do
  let(:user) { User.new(email: 'sample@email.com') }

  it 'returns expected token' do
    jwt_encode = described_class.new(user)
    expect(jwt_encode.token).to be_present
  end
end
