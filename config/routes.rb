Rails.application.routes.draw do
  devise_for :users

  resources :content_items, only: %i[index new create]
  resources :social_networks, only: %i[index new create]

  root to: 'content_items#index'
end
