Rails.application.routes.draw do
  # Artists
  get 'artists', to: 'artists#index', as: 'artists_index'
  get 'artists/:eartist', to: 'artists#show', as: 'artist_show'
  post 'artists', to: 'artists#create', as: 'artist_create'
  get 'artists/:eartist/albums', to: 'artists#artist_albums', as: 'artist_albums'
  get 'artists/:eartist/tracks', to: 'artists#artist_tracks', as: 'artist_tracks'
  put 'artists/:eartist/albums/play', to: 'artists#artist_play', as: 'artist_play'
  delete 'artists/:eartist', to: 'artists#delete', as: 'artist_delete'

  # Albums
  get 'albums', to: 'albums#index', as: 'albums_index'
  get 'albums/:ealbum', to: 'albums#show', as: 'album_show'
  put 'albums/:ealbum/tracks/play', to: 'albums#album_play', as: 'album_play'

  get 'albums/:ealbum/tracks', to: 'albums#album_tracks', as: 'album_tracks'
  post 'artists/:eartist/albums', to: 'albums#create', as: 'album_create'
  delete 'albums/:ealbum', to: 'albums#delete', as: 'album_delete'



  # Tracks
  get 'tracks', to: 'tracks#index', as: 'tracks_index'
  get 'tracks/:etrack', to: 'tracks#show', as: 'track_show'
  post 'albums/:ealbum/tracks', to: 'tracks#create', as: 'track_create'
  put 'tracks/:etrack/play', to: 'tracks#track_play', as: 'track_play'
  delete 'tracks/:etrack', to: 'tracks#delete', as: 'track_delete'
  get '/', to: 'artists#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#home'
end
