require 'rails_helper'

RSpec.describe ReservationRuleLine do
  describe '#dates' do
    subject { described_class.new(weekday: weekday, start_on: start_on, span: span, interval: interval).dates(stop_date) }

    let(:stop_date) { Date.new(2016, 10, 3) }

    context 'when start_on is not passed' do
      {
          monday:     { wday: 1, result: [Date.new(2016,9,19), Date.new(2016,9,26)] },
          tuesday:    { wday: 2, result: [Date.new(2016,9,20), Date.new(2016,9,27)] },
          wednesday:  { wday: 3, result: [Date.new(2016,9,21), Date.new(2016,9,28)] },
          thursday:   { wday: 4, result: [Date.new(2016,9,22), Date.new(2016,9,29)] },
          friday:     { wday: 5, result: [Date.new(2016,9,23), Date.new(2016,9,30)] },
          saturday:   { wday: 6, result: [Date.new(2016,9,24), Date.new(2016,10,1)] },
          sunday:     { wday: 0, result: [Date.new(2016,9,25), Date.new(2016,10,2)] }
      }.each do |weekday, attributes|
        context "when weekday is #{weekday}" do
          let(:weekday) { attributes[:wday] }
          let(:start_on) { nil }
          let(:span) { 1 }
          let(:interval) { 'week' }

          it 'returns correct dates' do
            Timecop.freeze(Time.local(2016,9,22,12,0)) do
              expect(subject).to eq attributes[:result]
            end
          end
        end
      end
    end

    context 'when start_on is passed' do
      {
          monday:     { wday: 1, start_on: Date.new(2016,9,26), result: [Date.new(2016,9,26)] },
          tuesday:    { wday: 2, start_on: Date.new(2016,9,27), result: [Date.new(2016,9,27)] },
          wednesday:  { wday: 3, start_on: Date.new(2016,9,28), result: [Date.new(2016,9,28)] },
          thursday:   { wday: 4, start_on: Date.new(2016,9,29), result: [Date.new(2016,9,29)] },
          friday:     { wday: 5, start_on: Date.new(2016,9,30), result: [Date.new(2016,9,30)] },
          saturday:   { wday: 6, start_on: Date.new(2016,10,1), result: [Date.new(2016,10,1)] },
          sunday:     { wday: 0, start_on: Date.new(2016,10,2), result: [Date.new(2016,10,2)] }
      }.each do |weekday, attributes|
        context "when weekday is #{weekday}" do
          let(:weekday) { attributes[:wday] }
          let(:start_on) { attributes[:start_on] }
          let(:span) { 1 }
          let(:interval) { 'week' }

          it 'returns correct dates' do
            Timecop.freeze(Time.local(2016,9,22,12,0)) do
              expect(subject).to eq attributes[:result]
            end
          end
        end
      end
    end
  end
end