class PlaylistsController < ApplicationController

  before_filter :find_playlist, :except => :index

  def index
    @playlists = Playlist.all
  end

  def show
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:id])
    end
end
