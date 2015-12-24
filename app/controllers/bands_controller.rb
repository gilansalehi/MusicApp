class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def edit
    @band = Band.new(band_params)
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    # redundant with edit?
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
  end

  private
  def band_params
    params.require(:band).permit(:name, :albums)
  end
end
