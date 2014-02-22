require 'spec_helper'

describe Playlist do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) } 
  it { should have_many(:playlist_songs) }
  it { should validate_presence_of(:title) }
  it { should have_many(:songs).through(:playlist_songs) }
end
