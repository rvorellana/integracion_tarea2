class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks
  end

  def show
    name = params[:etrack]
    @track = Track.find_by etrack: name

    if @track
      render json: @track, status: :created
    else
      render json: "error", status: :bad_request
    end
  end

  def create
    album_name = params[:etrack]
    album = Album.find_by ealbum: album_name
    if track
      @track_params = params.require(:track).permit(:name, :duration)
      @track_params[:album_id] = album.id
      @track = Track.new(@album_params)
      @track.encodetrack

      # render json: @album, status: :created

      if @track.save
        render json: @track, status: :created
      else
        render json: "error no se pudo", status: :bad_request
      end

    else
      render json: "error no hay artista", status: :bad_request

    end

  end

  def delete
    name = params[:etrack]
    @track = Track.find_by etrack: name
    @track.destroy
    render json: "bien"
  end
end
