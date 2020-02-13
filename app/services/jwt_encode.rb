# frozen_string_literal: true

class JwtEncode
  SECRET_KEY = Rails.application.credentials.secret_key_base
  ALGORITHM = 'HS256'

  def initialize(user)
    @user = user
  end

  def token
    payload = { user_id: @user.id }
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end
end
