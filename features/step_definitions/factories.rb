FactoryGirl.define do
  factory :user do
    name     "foo Hartl"
    email    "foo@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end