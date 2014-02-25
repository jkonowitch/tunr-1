class PlaylistUser < ActiveRecord::Base
  validates :playlist, :user, presence: true
  belongs_to :playlist
  belongs_to :user
end