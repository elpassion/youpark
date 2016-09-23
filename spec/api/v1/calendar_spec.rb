require 'rails_helper'

RSpec.describe 'api/v1', type: :request do
  describe 'GET /calendar' do
    before :all do
      Customer.create(database: 'elpassion', name: 'EL Passion')
      Apartment::Tenant.create('elpassion')
      Apartment::Tenant.switch!('elpassion')

      user = create(:user)
      @token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id)

      user_parking_space = ParkingSpace.where(number: 6).first_or_create!
      owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!
      reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
          { weekday: 2, start_on: nil, span: 1, interval: 'week' },
          { weekday: 4, start_on: nil, span: 1, interval: 'week' },
          { weekday: 5, span: 2, interval: 'week', start_on: Date.new(2016, 9, 23) }
      ])
      UpdateReservationRuleService.new.execute(reservation_rule, {})

    end

    after :all do
      Apartment::Tenant.drop('elpassion')
    end

    it 'shows the next 5 business days' do
      get '/c/elpassion/api/v1/calendar', params: { access_token: @token.token }
      expected_body = {"dates" => {"2016-09-22"=>{"free_spaces"=>0, "total_spaces"=>1, "user_reservation"=>true},
                                   "2016-09-23"=>{"free_spaces"=>0, "total_spaces"=>1, "user_reservation"=>true},
                                   "2016-09-27"=>{"free_spaces"=>0, "total_spaces"=>1, "user_reservation"=>true}}}

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(expected_body)
    end
  end
end
