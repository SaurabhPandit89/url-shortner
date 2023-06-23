# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/:short', to: 'api/v1/urls#show'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/retreive_token', to: 'users#retreive_token'
      resources :urls, only: %i[index create]
    end
  end
end
