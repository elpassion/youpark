FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@example.com" }
    sequence(:name)  { |n| "test name #{n}" }
    password { SecureRandom.hex(10) }
    password_confirmation { password }
    confirmed_at { 7.days.ago }
  end
end