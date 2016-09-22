class ReservationRuleLine
  include Virtus.model
  include ActiveModel::Validations

  attribute :weekday, Integer
  attribute :start_on, Date
  attribute :span, Integer # number of intervals
  attribute :interval, String # week

  validates :weekday, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :span, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :interval, presence: true, inclusion: { in: %w(week) }

  validate do |rule_line|
    next unless rule_line.start_on.blank?

    if rule_line.wday != rule.weekday
      errors.add :start_on, 'has to be the same weekday'
    end
  end

  def dates(stop_date)
    current_date = start_on || weekday_on_current_week
    [].tap do |dates|
      while current_date < stop_date
        dates << current_date
        current_date += span.send(interval)
      end
    end
  end

  def weekday_on_current_week
    Date.today.beginning_of_week + (weekday == 0 ? 6 : weekday - 1)
  end
end