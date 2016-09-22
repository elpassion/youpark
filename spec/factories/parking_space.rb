FactoryGirl.define do
  factory :parking_space do
    sequence(:number) { |n| n }
  end
end