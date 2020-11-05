Rails.application.routes.draw do
  #tells devise where to find RegistrationsController (for the controllers, look for our registrations controller)
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }

  get '/search', to: 'pets#search', as: 'search_page'
  
  resources :pets do
    resources :events, only: [:show, :new]
  end

  resources :users, :only => [:show]
  
  resources :events, only: [:destroy, :create]
  
  patch '/events/:id/accept', to: 'events#accept'
  patch '/events/:id/decline', to: 'events#decline'


  root to: "application#home"
end
