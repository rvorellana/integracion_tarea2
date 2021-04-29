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
      render json: @album.index(request.host), status: :ok
    end
  end

  def create

    if ((params[:album].key?("name")) && (params[:album].key?("genre")) && (params[:album].keys.length ==2 ))
      artist_name = params[:eartist]
      artist = Artist.find_by eartist: artist_name
      if artist.nil?
        render json: "Error no existe artista", status: :unprocessable_entity
        
      else
        @album_params = params.require(:album).permit(:name, :genre)
        @album_params[:artist_id] = artist.id
        @album = Album.new(@album_params)
        @album.encodealbum

        album_exists = Album.find_by name: @album.name
        if album_exists.nil?
          if @album.save
            render json: @album.index(request.host), status: :created
          else
            render json: "error no se pudo", status: :bad_request
          end
        else
          render json: album_exists.index(request.host), status: :conflict
        end
      end
    else
      render json: "error no se pudo", status: :bad_request
    end
  end


  def album_tracks
    name = params[:ealbum]
    album = Album.find_by ealbum: name
    if album.nil?
      render json: "Not found", status: :not_found
    else
      if album.tracks.empty?
        render json: "", status: :ok
      else
        render json: album.tracks.map{|c| c.index(request.host)}, status: :ok
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
