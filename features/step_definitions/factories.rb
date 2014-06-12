FactoryGirl.define do
  factory :user do
    name     "foo Hartl"
    email    "foo@example.com"
    password "foobar123"
    password_confirmation "foobar123"
  end
end