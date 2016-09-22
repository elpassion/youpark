FactoryGirl.define do
  factory :reservation_rule do
    owner
    rules {
      [
        { weekday: 1, start_on: nil, span: 1, interval: 'week' },
        { weekday: 2, start_on: nil, span: 1, interval: 'week' },
        { weekday: 3, start_on: nil, span: 1, interval: 'week' },
        { weekday: 4, start_on: nil, span: 1, interval: 'week' },
        { weekday: 5, start_on: nil, span: 1, interval: 'week' }
      ]
    }
  end
end