# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :auth do
        resources :google, only: %i[create]
      end
    end
  end
end
