Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  #get 'users/show'
  #get 'cities/show'
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #establish routes to gossips via rails routes
  resources :gossips
    #establish routes to users via rails routes
  resources :users, only: [:show, :new, :create]
  #establish routes to cities via rails routes
  resources :cities, only: [:show]
  resources :sessions

  #routes to static front pages: team, contact, welcome
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'
  get 'welcome/:first_name', to: 'front#welcome'

end
