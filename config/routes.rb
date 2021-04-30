Rails.application.routes.draw do
  # Artists
  get 'artists', to: 'artists#index', as: 'artists_index'
  get 'artists/:eartistid', to: 'artists#show', as: 'artist_show'
  post 'artists', to: 'artists#create', as: 'artist_create'
  get 'artists/:eartistid/albums', to: 'artists#artist_albums', as: 'artist_albums'
  get 'artists/:eartistid/tracks', to: 'artists#artist_tracks', as: 'artist_tracks'
  put 'artists/:eartistid/albums/play', to: 'artists#artist_play', as: 'artist_play'
  delete 'artists/:eartistid', to: 'artists#delete', as: 'artist_delete'

  # Albums
  get 'albums', to: 'albums#index', as: 'albums_index'
  get 'albums/:ealbumid', to: 'albums#show', as: 'album_show'
  put 'albums/:ealbumid/tracks/play', to: 'albums#album_play', as: 'album_play'

  get 'albums/:ealbumid/tracks', to: 'albums#album_tracks', as: 'album_tracks'
  post 'artists/:eartistid/albums', to: 'albums#create', as: 'album_create'
  delete 'albums/:ealbumid', to: 'albums#delete', as: 'album_delete'



  # Tracks
  get 'tracks', to: 'tracks#index', as: 'tracks_index'
  get 'tracks/:etrackid', to: 'tracks#show', as: 'track_show'
  post 'albums/:ealbumid/tracks', to: 'tracks#create', as: 'track_create'
  put 'tracks/:etrackid/play', to: 'tracks#track_play', as: 'track_play'
  delete 'tracks/:etrackid', to: 'tracks#delete', as: 'track_delete'
  get '/', to: 'artists#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#home'
end
