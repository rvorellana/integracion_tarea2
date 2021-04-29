class ArtistsController < ApplicationController
  def index
    if Artist.all.empty?
      render json: Artist.all, status: :ok
    else
      @artists = Artist.all.map{|c| c.index(request.host)}
      render json: @artists, status: :ok
    end
  end

  def show
    name = params[:eartist]
    @artist = Artist.find_by eartist: name

    if @artist.nil?
      render json: "Not_found", status: :not_found
    else
      render json: @artist.index(request.host), status: :ok
    end
  end

  def create
    @artist_params = params.require(:artist).permit(:name, :age)
    @artist = Artist.new(@artist_params)
    @artist.encodeartist
    
    artist_exists = Artist.find_by name: @artist.name
    if artist_exists.nil?
      if @artist.save
        render json: @artist.index(request.host), status: :created
      else
        render json: "Bad Request", status: :bad_request
      end
    else
      render json: artist_exists.index(request.host), status: :conflict
    end
  end


  def artist_albums
    name = params[:eartist]
    artist = Artist.find_by eartist: name
    if artist.nil?
      render json: "Not found", status: :not_found
    else
      if artist.albums.empty?
        render json: @artist.albums, status: :ok
      else
        @albums = artist.albums.map{|c| c.index(request.host)}
        render json: @albums
      end
    end
  end


  def delete
    name = params[:eartist]
    @artist = Artist.find_by eartist: name
    if @artist.empty?
      render json: "No existe", status: :not_found
    else
      @artist.destroy
      render json: "Eliminado", status: :no_content
    end
    
    render json: "Eliminado", status: :no_content
  end
end
