# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Apartment::Tenant.switch!('elpassion')

### katarzyna.dolezal@elpassion.pl
user = User.where(email: 'katarzyna.dolezal@elpassion.pl').first_or_create!(
    name: 'Katarzyna Doleżał',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 1).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, start_on: nil, span: 1, interval: 'week' }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### marcin.wieclawski@elpassion.pl
user = User.where(email: 'marcin.wieclawski@elpassion.pl').first_or_create!(
    name: 'Marcin Więcławski',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 2).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, start_on: nil, span: 1, interval: 'week' }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### mariusz.kulerski@elpassion.pl
user = User.where(email: 'mariusz.kulerski@elpassion.pl').first_or_create!(
    name: 'Mariusz Kulerski',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 3).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, start_on: nil, span: 1, interval: 'week' }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### dariusz.rybicki@elpassion.pl
user = User.where(email: 'dariusz.rybicki@elpassion.pl').first_or_create!(
    name: 'Dariusz Rybicki',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 4).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, start_on: nil, span: 1, interval: 'week' }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### jakub.nowakowski@elpassion.pl
user = User.where(email: 'jakub.nowakowski@elpassion.pl').first_or_create!(
    name: 'Jakub Nowakowski',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 5).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, start_on: nil, span: 1, interval: 'week' }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### adrian.serafin@elpassion.pl
user = User.where(email: 'adrian.serafin@elpassion.pl').first_or_create!(
    name: 'Adrian Serafin',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 6).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 2, start_on: nil, span: 1, interval: 'week' },
    { weekday: 4, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, span: 2, interval: 'week', start_on: Date.new(2016, 9, 23) }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### piotr.kmita@elpassion.pl
user = User.where(email: 'piotr.kmita@elpassion.pl').first_or_create!(
    name: 'Piotr Kmita',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 6).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

reservation_rule = ReservationRule.where(owner: owner.id).first_or_create!(rules: [
    { weekday: 1, start_on: nil, span: 1, interval: 'week' },
    { weekday: 3, start_on: nil, span: 1, interval: 'week' },
    { weekday: 5, span: 2, interval: 'week', start_on: Date.new(2016, 9, 30) }
])
UpdateReservationRuleService.new.execute(reservation_rule, {})

### artiom.piatrykin@elpassion.pl
user = User.where(email: 'artiom.piatrykin@elpassion.pl').first_or_create!(
    name: 'Artiom Piatrykin',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 7).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

### kasper.kondzielski@elpassion.pl
user = User.where(email: 'kasper.kondzielski@elpassion.pl').first_or_create!(
    name: 'Kasper Kondzielski',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 7).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

### michal.ptaszynski@elpassion.pl
user = User.where(email: 'michal.ptaszynski@elpassion.pl').first_or_create!(
    name: 'Michał Ptaszyński',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 8).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!

### k.ksiezopolski@elpassion.com
user = User.where(email: 'kasper.kondzielski@elpassion.pl').first_or_create!(
    name: 'Konrad Księżopolski',
    password: 'test123test',
    password_confirmation: 'test123test',
    confirmed_at: Time.zone.now
)
user_parking_space = ParkingSpace.where(number: 8).first_or_create!
owner = Owner.where(user: user, parking_space: user_parking_space).first_or_create!