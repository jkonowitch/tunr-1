FactoryGirl.define do
  factory :song do
    title "Tick Tock"
    year 2000
    preview_url "http://google.com"
    artist
  end
end