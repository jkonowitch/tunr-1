# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist_song do
    song
    playlist
  end
end
