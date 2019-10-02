Rails.application.routes.draw do
  resources :vote_counts
  resources :events
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :songs, only: [:index, :show]
  resources :playlists, only: [:index, :show, :create, :update, :destroy]
  resources :playlist_songs, only: [:index, :show, :create, :update, :destroy]

  get '/auth/spotify/callback', to: 'users#create'
  get '/api/v1/login', to: 'login#create'
  post '/events/user', to: 'events#getuserevents'
end
