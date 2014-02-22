class PlaylistSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :playlist
  validates :song, :playlist, presence: true
  validate :user_owns_song

  private

  def user_owns_song
    return unless playlist
    unless playlist.user.songs.include?(song)
      errors.add(:song, "This user doesn't own this song!")
    end
  end
end
