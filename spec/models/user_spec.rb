# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email and avatar_url' do
    user = User.new(email: 'sample@email.com', avatar_url: 'http://sample.image.com')
    user.valid?
    expect(user.errors).to be_empty
  end
end
