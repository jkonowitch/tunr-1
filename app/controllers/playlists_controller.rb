class PlaylistsController < ApplicationController
  before_action :load_user, only: [:new, :create]
  before_action :load_playlist, only: [:edit, :show]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = @user.playlists.create(title: params[:playlist][:title])
    @playlist.purchases << @user.purchases.where( 
      song_id: params[:playlist][:songs]
    )
    redirect_to playlist_path(@playlist)
  end

  def show
  end

  def edit
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end

  def load_playlist
    @playlist = Playlist.find_by(id: params[:id])
  end
end