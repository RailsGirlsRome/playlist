class SongsController < ApplicationController
  before_filter :find_playlist
  before_filter :find_song,     :only => :destroy

  def create
    @song = @playlist.songs.new(params[:song])
    if @song.save
      flash[:notice] = "Added song to playlist."
    else
      flash[:alert] = "There was a problem saving the song."
    end
    redirect_to(playlist_path(@song.playlist))
  end

  def destroy
    @song.destroy
    flash[:notice] = "Removed song from playlist."
    redirect_to(playlist_path(@song.playlist))
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    def find_song
      @song = @playlist.songs.find(params[:id])
    end
end
