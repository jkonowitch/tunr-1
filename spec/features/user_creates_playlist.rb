require 'spec_helper'

describe "a user creating a playlist" do

  let(:user) { FactoryGirl.create(:user) }
  let(:tick_tock) { FactoryGirl.create(:song, title: "Tick Tock") }
  let(:hotel_california) { FactoryGirl.create(:song, title: "Hotel California") }

  before do
    user.songs.append([tick_tock, hotel_california])
    login(user)
  end

  it "creates a playlist" do
    click_link "Create playlist"
    fill_in "Title", with: "Classic Rock"
    select "Hotel California", from: "playlist_songs"
    click_button "Create"

    within ".playlist .songs" do
      expect(page).to have_content "Hotel California"
      expect(page).to_not have_content "Tick Tock"
    end
  end

  def login(user)
    visit "login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end
end