class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end
end
