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

  get '/events/past_events', to: 'events#past_events'
  get '/events/pending', to: 'events#pending'
  
  resources :events, only: [:destroy, :create, :show]
  
  patch '/events/:id/accept', to: 'events#accept'
  patch '/events/:id/decline', to: 'events#decline'


  root to: "application#home"
end
