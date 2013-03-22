class SongsController < ApplicationController
  before_filter :find_playlist
  before_filter :find_song, :only => [ :update, :destroy ]

  def create
    @playlist.songs.create(params[:song])
    flash[:notice] = "Added song to playlist."
    render :nothing => true
  end

  def update
    @song.update_attributes(params[:song])
    render :nothing => true
  end

  def destroy
    @song.destroy
    flash[:notice] = "Deleted song."
    redirect_to playlist_path(@song.playlist)
  end

  protected

    def find_playlist
      @playlist = Playlist.from_param(params[:playlist_id])
    end

    def find_song
      @song = @playlist.songs.find(params[:id])
    end
end
