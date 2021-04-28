class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: request.host
  end

  def show
    name = params[:eartist]
    @artist = Artist.find_by eartist: name

    if @artist
      render json: @artist, status: :created
    else
      render json: "error", status: :bad_request
    end
  end

  def create
    @artist_params = params.require(:artist).permit(:name, :age)
    @artist = Artist.new(@artist_params)
    @artist.encodeartist
    if @artist.save
      render json: @artist, status: :created
    else
      render json: "error", status: :bad_request
    end
  end


  def update
    name = params[:eartist]
    @artist = Artist.find_by eartist: name
    @artist_params = params.require(:artist).permit(:name, :age)

    if @artist.update(@artist_params)
      render json: @artist, status: :created
    else
      render json: @artist, status: :bad_request
    end
  end

  def delete
    name = params[:eartist]
    @artist = Artist.find_by eartist: name
    @artist.destroy
    
    render json: "bien"
  end
end
