class TracksController < ApplicationController

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new

    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(track_params[:album_id])
    else
      render :new
    end
  end

  def edit
    @track = Track.new(track_params)
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    # redundant with edit?
  end

  def destroy
    @track = Track.find(params[:id])
    @track.delete
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id)
  end
end
