FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :chatroom do
    name Faker::Lorem.characters(10)
    private_chatroom false
    association :owner, factory: :user
  end

  factory :private_chatroom, class: Chatroom do
    #name must be set on creation
    private_chatroom true
    association :owner, factory: :user
  end

  factory :chatroom_user do
    user
    chatroom
    checked_at nil
  end

  factory :message do
    body Faker::Lorem.sentence
    user
    chatroom
  end
end