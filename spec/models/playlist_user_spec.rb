require 'spec_helper'

describe PlaylistUser do
  it { should belong_to(:playlist) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:playlist) }
  it { should validate_presence_of(:user) } 
end