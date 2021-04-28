Rails.application.routes.draw do
  get 'artists', to: 'artists#index', as: 'artists_index'
  get 'artists/:eartist', to: 'artist#show', as: 'artist_show'
  post 'artists', to: 'artists#create', as: 'artist_create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#index'
end
