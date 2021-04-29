class AlbumsController < ApplicationController
  def index
    if Album.all.empty?
      render json: Album.all, status: :ok
    else
      @albums = Album.all.map{|c| c.index(request.host)}
      render json: @albums, status: :ok
    end
  end

  def show
    name = params[:ealbum]
    @album = Album.find_by ealbum: name

    if @album.nil?
      render json: "Not Found", status: :not_found
    else
      render json: @album.index, status: :ok
    end
  end

  def create
    artist_name = params[:eartist]
    artist = Artist.find_by eartist: artist_name
    if artist.nil?
      render json: "Error no existe artista", status: :not_found
      
    else
      @album_params = params.require(:album).permit(:name, :genre)
      @album_params[:artist_id] = artist.id
      @album = Album.new(@album_params)
      @album.encodealbum

      album_exists = Album.find_by name: @album.name
      if album_exists.nil?
        if @album.save
          render json: @album.index, status: :created
        else
          render json: "error no se pudo", status: :bad_request
        end
      else
        render json: album_exists.index, status: :conflict
      end
    end
  end

  def delete
    name = params[:eartist]
    @album = Album.find_by ealbum: name
    if @album.empty?
      render json: "No existe", status: :not_found
    else
      @album.destroy
      render json: "bien", status: :no_content
    end
  end
end