require 'spec_helper'

describe PlaylistSong do
  it { should belong_to(:playlist) }
  it { should belong_to(:song) }
  it { should validate_presence_of(:song) }
  it { should validate_presence_of(:playlist) }

  it "doesn't add songs the user doesn't own" do
    tick_tock = FactoryGirl.create(:song, title: "Tick Tock")
    hotel_california = FactoryGirl.create(:song, title: "Hotel California")
    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user: user)

    user.songs << hotel_california

    expect(
      PlaylistSong.new(
        song: hotel_california, 
        playlist: playlist
      ).errors[:song]
    ).to have(0).errors_on(:song)

    expect(
      PlaylistSong.new(
        song: tick_tock, 
        playlist: playlist
      )
    ).to have(1).errors_on(:song)
  end
end
