Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users
  resources :businesses do
    resources :reservations, shallow: true
  end
  get 'logout', to: 'sessions#destroy'
  root 'businesses#new'
end
