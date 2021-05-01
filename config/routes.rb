Rails.application.routes.draw do
  get 'errors/index'
  # Artists
  get 'artists', to: 'artists#index', as: 'artists_index'
  post 'artists', to: 'artists#create', as: 'artist_create'
  delete 'artists', to: 'errors#index'
  put 'artists', to: 'errors#index'

  get 'artists/:eartistid', to: 'artists#show', as: 'artist_show'
  delete 'artists/:eartistid', to: 'artists#delete', as: 'artist_delete'
  put 'artists/:eartistid', to: 'errors#index'
  post 'artists/:eartistid', to: 'errors#index'

  get 'artists/:eartistid/albums', to: 'artists#artist_albums', as: 'artist_albums'
  post 'artists/:eartistid/albums', to: 'albums#create', as: 'album_create'
  put 'artists/:eartistid/albums', to: 'errors#index'
  delete 'artists/:eartistid/albums', to: 'errors#index'

  get 'artists/:eartistid/tracks', to: 'artists#artist_tracks', as: 'artist_tracks'
  post 'artists/:eartistid/tracks', to: 'errors#index'
  put 'artists/:eartistid/tracks', to: 'errors#index'
  delete 'artists/:eartistid/tracks', to: 'errors#index'

  put 'artists/:eartistid/albums/play', to: 'artists#artist_play', as: 'artist_play'
  post 'artists/:eartistid/albums/play', to: 'errors#index'
  get 'artists/:eartistid/albums/play', to: 'errors#index'
  delete 'artists/:eartistid/albums/play', to: 'errors#index'

  # Albums
  get 'albums', to: 'albums#index', as: 'albums_index'
  post 'albums', to: 'errors#index'
  put 'albums', to: 'errors#index'
  delete 'albums', to: 'errors#index'

  get 'albums/:ealbumid', to: 'albums#show', as: 'album_show'
  delete 'albums/:ealbumid', to: 'albums#delete', as: 'album_delete'
  put 'albums/:ealbumid', to: 'errors#index'
  post 'albums/:ealbumid', to: 'errors#index'

  put 'albums/:ealbumid/tracks/play', to: 'albums#album_play', as: 'album_play'
  get 'albums/:ealbumid/tracks/play', to: 'errors#index'
  post 'albums/:ealbumid/tracks/play', to: 'errors#index'
  delete 'albums/:ealbumid/tracks/play', to: 'errors#index'

  get 'albums/:ealbumid/tracks', to: 'albums#album_tracks', as: 'album_tracks'
  post 'albums/:ealbumid/tracks', to: 'tracks#create', as: 'track_create'
  put 'albums/:ealbumid/tracks', to: 'errors#index'
  delete 'albums/:ealbumid/tracks', to: 'errors#index'

  # Tracks
  get 'tracks', to: 'tracks#index', as: 'tracks_index'
  post 'tracks', to: 'errors#index'
  put 'tracks', to: 'errors#index'
  delete 'tracks', to: 'errors#index'

  get 'tracks/:etrackid', to: 'tracks#show', as: 'track_show'
  delete 'tracks/:etrackid', to: 'errors#index'
  put 'tracks/:etrackid', to: 'errors#index'
  post 'tracks/:etrackid', to: 'errors#index'
  
  put 'tracks/:etrackid/play', to: 'tracks#track_play', as: 'track_play'
  post 'tracks/:etrackid/play', to: 'errors#index'
  get 'tracks/:etrackid/play', to: 'errors#index'
  delete 'tracks/:etrackid/play', to: 'errors#index'

  get '/', to: 'artists#home', as: 'home'
  post '/', to: 'errors#index'
  put '/', to: 'errors#index'
  delete '/', to: 'errors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#home'
end
