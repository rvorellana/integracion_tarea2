Rails.application.routes.draw do
  # Artists
  get 'artists', to: 'artists#index', as: 'artists_index'
  get 'artists/:eartist', to: 'artists#show', as: 'artist_show'
  post 'artists', to: 'artists#create', as: 'artist_create'
  get 'artists/:eartist/albums', to: 'artists#artist_albums', as: 'artist_albums_path'
  delete 'artists', to: 'artists#delete', as: 'artist_delete'

  # Albums
  get 'albums', to: 'albums#index', as: 'albums_index'
  get 'albums/:ealbum', to: 'albums#show', as: 'album_show'
  post 'artists/:eartist/albums', to: 'albums#create', as: 'album_create'
  delete 'albums', to: 'albums#delete', as: 'album_delete'



  # Tracks
  get 'tracks', to: 'tracks#index', as: 'tracks_index'
  get 'tracks/:etrack', to: 'tracks#show', as: 'track_show'
  post 'albums/:ealbum/tracks', to: 'tracks#create', as: 'track_create'
  delete 'tracks', to: 'tracks#delete', as: 'track_delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#index'
end
