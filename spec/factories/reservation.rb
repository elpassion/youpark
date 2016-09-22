FactoryGirl.define do
  factory :reservation do
    reservation_rule
    user { reservation_rule.user }
    parking_space { reservation_rule.parking_space }
    reservation_date { Date.today }
  end
end