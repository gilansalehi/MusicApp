class NotesController < ApplicationController

  def new
    @track = Track.find(params[:id])
    @note = @tracks.notes.new

    render track_url(note_params[:track_id])
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to track_url(note_params[:track_id])
    else
      # or just render the track page
      render track_url(note_params[:track_id])
    end
  end
  #
  # def edit
  #   @track = Track.new(track_params)
  #   render :edit
  # end

  private
  def note_params
    params.require(:note).permit(:title, :body, :user_id, :track_id)
  end
end
