class TracksController < ApplicationController
  def index
    @tracks = Track.all
    if Track.all.empty?
      render json: @tracks, status: :ok
    else
      render json: @tracks.map{|c| c.index(request.host)}, status: :ok
    end
  end

  def show
    name = params[:etrack]
    @track = Track.find_by ealbum: name

    if @track.nil?
      render json: "Not Found", status: :not_found
    else
      render json: @track.index, status: :ok
    end
  end

  def create
    album_name = params[:etrack]
    album = Album.find_by ealbum: album_name
    if album.nil?
      render json: "Error no existe album", status: :not_found
    else
      @track_params = params.require(:track).permit(:name, :duration)
      @track_params[:album_id] = album.id
      @track_params["times_played"] = 0
      @track = Track.new(@track_params)
      @track.encodetrack
      track_exists = Track.find_by name: @track.name
      if track_exists.empty?
        if @track.save
          render json: @track.index, status: :created
        else
          render json: "error no se pudo", status: :bad_request
        end
      else
        render json: track_exists.index, status: :conflict
      end
    end
  end

  def delete
    name = params[:etrack]
    @track = Track.find_by etrack: name
    if @track.empty?
      render json: "No existe", status: :not_found
    else
      @track.destroy
      render json: "bien", status: :no_content
    end
  end
end
