class PlaylistsController < ApplicationController

  before_filter :find_playlist, :except => :index

  def index
    @playlists = Playlist.all
  end

  def show
  end

  protected

    def find_playlist
      @playlist = Playlist.by_param(params[:id])
    end
end
