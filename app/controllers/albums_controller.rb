class AlbumsController < ApplicationController

  def index
    Album.all
    render :index
  end

  def new
    @band = Band.find(params[:band_id])
    @album = @band.albums.new

    render :new
  end

  def create


    @album = Album.new(album_params)

    if @album.save
      redirect_to band_url(album_params[:band_id])
    else
      render :new
    end
  end

  def edit
    @album = Album.new(album_params)
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    # redundant with edit?
  end

  def destroy
    @album = album.find(params[:id])
    @album.delete
  end

  private
  def album_params
    params.require(:album).permit(:title, :yr, :band_id)
  end
end
