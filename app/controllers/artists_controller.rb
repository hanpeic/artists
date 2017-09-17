class ArtistsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: LastFm.new.top_artists(params[:country], params[:page])
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: LastFm.new.top_tracks(params[:name], params[:page])
      end
    end
  end
end
