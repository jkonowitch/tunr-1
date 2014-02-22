class PlaylistsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
    @playlist = Playlist.new
  end
end