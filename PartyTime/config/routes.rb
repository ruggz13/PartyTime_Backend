Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :update, :destroy]
  resources :songs, only: [:index, :show]
  resources :playlist, only: [:index, :show, :create, :update, :destroy]
  resources :playlist_songs, only: [:index, :show, :update, :destroy]
end
