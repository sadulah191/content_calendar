# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :content_items, only: %i[index show new create edit update destroy] do
    collection do
      get 'calendar'
    end
  end
  resources :social_networks, only: %i[index new create]

  root to: 'content_items#index'
end
