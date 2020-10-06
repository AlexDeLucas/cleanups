FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "ecowarrior#{n}@example.com" }
      password { 'Earth1234' }
      password_confirmation { 'Earth1234' }
      role { 'user' }
    end
  end