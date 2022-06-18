Rails.application.routes.draw do
  root 'home#index'

  resources :addresses

  get '*path', to: 'addresses#redirect'
end
