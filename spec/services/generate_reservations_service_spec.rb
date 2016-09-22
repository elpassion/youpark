require 'rails_helper'

RSpec.describe GenerateReservationsService do
  describe '#execute_and_save' do
    let(:reservation_rule) { create(:reservation_rule) }

    subject { described_class.new(reservation_rule).execute_and_save(Date.new(2016, 10, 3)) }

    context 'when there is no prev reservation' do
      it 'creates new reservations' do
        Timecop.freeze(Time.local(2016,9,22,12,0)) do
          expect { subject }.to change { Reservation.count }.by 10
        end
      end
    end

    context 'when there is prev reservation on some days' do
      let!(:reservation) { create(:reservation, parking_space: reservation_rule.parking_space, reservation_date: Date.new(2016,9,21)) }

      it 'does not raise an error' do
        Timecop.freeze(Time.local(2016,9,22,12,0)) do
          expect { subject }.to_not raise_error
        end
      end

      it 'creates correct number of new reservations' do
        Timecop.freeze(Time.local(2016,9,22,12,0)) do
          expect { subject }.to change { Reservation.count }.by 9
        end
      end

      it 'does not update existing reservation' do
        Timecop.freeze(Time.local(2016,9,22,12,0)) do
          old_attributes = reservation.attributes
          expect(reservation.reload.attributes).to eq old_attributes
        end
      end

    end
  end
end
