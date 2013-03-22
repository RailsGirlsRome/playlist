class SongsController < ApplicationController
  before_filter :find_playlist
  before_filter :find_song, :only => :update

  def create
    @playlist.songs.create(params[:song])
    render :nothing => true
  end

  def update
    @song.update_attributes(params[:song])
    render :nothing => true
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    def find_song
      @song = @playlist.songs.find(params[:id])
    end
end
