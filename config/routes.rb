Rails.application.routes.draw do
  # serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root 'home#show'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  get 'about', to: 'home#about'

  resources :chat_rooms
  resources :messages
end
