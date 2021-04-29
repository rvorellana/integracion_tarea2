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
      render json: @track.index(request.host), status: :ok
    end
  end

  def create
    if ((params[:track].key?("name")) && (params[:track].key?("duration")) && (params[:track].keys.length ==2 ))
      album_name = params[:ealbum]
      album = Album.find_by ealbum: album_name
      if album.nil?
        render json: "", status: :unprocessable_entity
      else
        @track_params = params.require(:track).permit(:name, :duration)
        @track_params[:album_id] = album.id
        @track_params["times_played"] = 0
        @track = Track.new(@track_params)
        @track.encodetrack
        track_exists = Track.find_by name: @track.name
        if track_exists.nil?
          if @track.save
            render json: @track.index(request.host), status: :created
          else
            render json: "error no se pudo", status: :bad_request
          end
        else
          render json: track_exists.index(request.host), status: :conflict
        end
      end
    else
      render json: "error no se pudo", status: :bad_request
    end
  end

  def delete
    name = params[:etrack]
    @track = Track.find_by etrack: name
    if @track.nil?
      render json: "No existe", status: :not_found
    else
      @track.destroy
      render json: "", status: :no_content
    end
  end
end
