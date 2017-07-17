Rails.application.routes.draw do
  # serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root 'home#show'
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  get 'about' => 'home#about'
  get 'u/:username' => 'users#show'

  resources :messages
end
