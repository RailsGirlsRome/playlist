class SongsController < ApplicationController
  before_filter :find_playlist

  def create
    @playlist.songs.create(params[:song])
    render :nothing => true
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end
end
