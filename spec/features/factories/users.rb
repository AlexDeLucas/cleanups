FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "litterbug#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      role { 'user' }
    end
  end