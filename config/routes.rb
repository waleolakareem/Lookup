# == Route Map
#
#                   Prefix Verb   URI Pattern                                         Controller#Action
#                 sessions GET    /sessions(.:format)                                 sessions#index
#                          POST   /sessions(.:format)                                 sessions#create
#              new_session GET    /sessions/new(.:format)                             sessions#new
#             edit_session GET    /sessions/:id/edit(.:format)                        sessions#edit
#                  session GET    /sessions/:id(.:format)                             sessions#show
#                          PATCH  /sessions/:id(.:format)                             sessions#update
#                          PUT    /sessions/:id(.:format)                             sessions#update
#                          DELETE /sessions/:id(.:format)                             sessions#destroy
#                    users GET    /users(.:format)                                    users#index
#                          POST   /users(.:format)                                    users#create
#                 new_user GET    /users/new(.:format)                                users#new
#                edit_user GET    /users/:id/edit(.:format)                           users#edit
#                     user GET    /users/:id(.:format)                                users#show
#                          PATCH  /users/:id(.:format)                                users#update
#                          PUT    /users/:id(.:format)                                users#update
#                          DELETE /users/:id(.:format)                                users#destroy
#    business_reservations GET    /businesses/:business_id/reservations(.:format)     reservations#index
#                          POST   /businesses/:business_id/reservations(.:format)     reservations#create
# new_business_reservation GET    /businesses/:business_id/reservations/new(.:format) reservations#new
#         edit_reservation GET    /reservations/:id/edit(.:format)                    reservations#edit
#              reservation GET    /reservations/:id(.:format)                         reservations#show
#                          PATCH  /reservations/:id(.:format)                         reservations#update
#                          PUT    /reservations/:id(.:format)                         reservations#update
#                          DELETE /reservations/:id(.:format)                         reservations#destroy
#               businesses GET    /businesses(.:format)                               businesses#index
#                          POST   /businesses(.:format)                               businesses#create
#             new_business GET    /businesses/new(.:format)                           businesses#new
#            edit_business GET    /businesses/:id/edit(.:format)                      businesses#edit
#                 business GET    /businesses/:id(.:format)                           businesses#show
#                          PATCH  /businesses/:id(.:format)                           businesses#update
#                          PUT    /businesses/:id(.:format)                           businesses#update
#                          DELETE /businesses/:id(.:format)                           businesses#destroy
#                   logout GET    /logout(.:format)                                   sessions#destroy
#                     root GET    /                                                   businesses#new
# 

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
