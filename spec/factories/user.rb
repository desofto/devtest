FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@gmail.com" }
    password 'qweqwe'

    after(:create) do |user|
      user.reset_authentication_token
    end
  end
end
