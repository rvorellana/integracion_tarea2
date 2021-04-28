class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
  end

  def create
    render json: params, status: :created
  end
end
