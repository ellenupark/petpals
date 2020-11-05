Rails.application.routes.draw do
  #tells devise where to find RegistrationsController (for the controllers, look for our registrations controller)
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks', sessions: 'users/sessions' }

  get '/search', to: 'pets#search', as: 'search_page'

  
  resources :pets do
    resources :events, only: [:show, :new]
  end

  devise_scope :user do
    get '/users/:id', to: 'users/sessions#show', as: 'user'
  end
  
  resources :events, only: [:destroy, :create]
  
  get '/events/history', to: 'events#history'
  get '/events/pending', to: 'events#pending'
  patch '/events/:id/accept', to: 'events#accept'
  patch '/events/:id/decline', to: 'events#decline'


  root to: "application#home"
end
