Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :twitter_searches, only: [:index]

  root to: 'twitter_searches#index'

  namespace :api, defaults: { format: :json } do
    resources :twitter_searches, only: [:create]
  end
end
