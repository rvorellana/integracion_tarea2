class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render json: @albums
  end

  def show
    name = params[:ealbum]
    @album = Artist.find_by ealbum: name

    if @album
      render json: @album, status: :created
    else
      render json: "error", status: :bad_request
    end
  end

  def create
    artist_name = params[:eartist]
    artist = Artist.find_by eartist: artist_name
    if artist
      @album_params = params.require(:album).permit(:name, :genre)
      @album_params[:artist_id] = artist.id
      @album = Album.new(@album_params)
      @album.encodealbum

      # render json: @album, status: :created

      if @album.save
        render json: @album, status: :created
      else
        render json: "error no se pudo", status: :bad_request
      end

    else
      render json: "error no hay artista", status: :bad_request

    end

  end

  def delete
    name = params[:eartist]
    @album = Album.find_by ealbum: name
    @album.destroy
    render json: "bien"
  end
end
