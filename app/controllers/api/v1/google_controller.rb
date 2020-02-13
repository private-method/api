# frozen_string_literal: true

module Api
  module V1
    class GoogleController < ApplicationController
      def create
        user = User.find_by(email: user_params[:email])
        user = User.create(user_params) if user.blank?
        jwt_encode = JwtEncode.new(user)
        token = jwt_encode.token
        render json: { jwt_token: token }
      end

      private

      def user_params
        params.permit(:email, :avatar_url)
      end
    end
  end
end
