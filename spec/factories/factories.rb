FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :chatroom do
    name Faker::Lorem.word
    private_chatroom false
  end

  factory :private_chatroom, class: Chatroom do
    #name must be set on creation
    private_chatroom true
  end

  factory :message do
    body Faker::Lorem.sentence
  end
end