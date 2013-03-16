class SongsController < ApplicationController
  before_filter :find_playlist, :only => :create

  def create
    @song = @playlist.songs.new(params[:song])
    if @song.save
      flash[:notice] = "Add song to playlist."
    else
      flash[:alert] = "There was a problem saving the song."
    end
    redirect_to(playlist_path(@song.playlist))
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end
end
