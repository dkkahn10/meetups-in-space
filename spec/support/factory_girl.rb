require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| n }
    sequence(:username) { |n| "jarlax#{n}" }
    sequence(:email) { |n| "jarlax#{n}@launchacademy.com" }
    avatar_url "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
  end
end

FactoryGirl.define do
  factory :meetup do
      sequence(:name) { |n| "#{n}uperAwesomePartyMeetup"}
      sequence(:description) { |n| "Its a meetup, and it's a #{n}uper awesome party"}
      sequence(:location) { |n| "F#{n}o#{n}o"}
      sequence(:creator_id) { |n| "#{n}"}
  end
end
