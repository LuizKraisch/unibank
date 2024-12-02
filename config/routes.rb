# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :accounts do
    resources :commands, only: [:create] do
      member do
        post :deposit
        post :withdraw
      end
    end

    resources :queries, only: [:show]
  end
end
