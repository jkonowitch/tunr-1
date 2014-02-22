FactoryGirl.define do
  factory :user do
    email "j@k.co"
    password "jeff"
    password_confirmation "jeff"
    first_name "Jeff"
    last_name "K"
    dob Date.today
    balance 0
  end
end