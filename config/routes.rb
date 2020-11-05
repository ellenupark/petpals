Rails.application.routes.draw do
  #tells devise where to find RegistrationsController (for the controllers, look for our registrations controller)
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks', sessions: 'users/sessions' }
  
  resources :pets do
    resources :events, only: [:show, :new]
  end

  get '/search', to: 'pets#search', as: 'search_page'

  devise_scope :user do
    get '/users/:id', to: 'users/sessions#show'
  end
  
  resources :events, only: [:destroy, :create]
  
  get '/events/past', to: 'events#past'
  patch '/events/:id/accept', to: 'events#accept'
  patch '/events/:id/decline', to: 'events#decline'


  root to: "application#home"
end
