class PlaylistUser < ActiveRecord::Base
  validates :playlist, presence: true
end