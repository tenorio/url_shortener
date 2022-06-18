Rails.application.routes.draw do
  root 'home#index'

  resources :addresses

  get 'top100', to: 'top100#index'

  get '*path', to: 'addresses#redirect'
end
