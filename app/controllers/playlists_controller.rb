class PlaylistsController < ApplicationController
  before_action :load_user, only: [:new, :create]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = @user.playlists.create(title: params[:playlist][:title])
    @playlist.songs.append(
      Song.find( params[:playlist][:songs].reject(&:blank?) )
    )

    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find_by(id: params[:id])
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end
end