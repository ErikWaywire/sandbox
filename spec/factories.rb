FactoryGirl.define do
  factory :user do
    name     "Erik Pearson"
    email    "erik@examples.com"
    password "foobar"
    password_confirmation "foobar"
  end
end