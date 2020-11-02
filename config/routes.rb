Rails.application.routes.draw do
  #tells devise where to find RegistrationsController (for the controllers, look for our registrations controller)
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }

  resources :pets do
    resources :events, only: [:show, :new]
  end
  
  resources :events, only: [:destroy, :create]
  
  patch '/events/:id', to: 'events#accept'
 

  root to: "application#home"
end
