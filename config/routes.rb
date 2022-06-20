Rails.application.routes.draw do
  require 'sidekiq/web'

  root 'home#index'

  resources :addresses

  get 'top100', to: 'top100#index'

  UrlShortener::Application.routes.draw do
    mount Sidekiq::Web => "/sidekiq"
  end

  get '*path', to: 'addresses#redirect'
end
