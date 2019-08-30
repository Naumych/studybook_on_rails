# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kiev = RailwayStation.create(title: 'Kiev')
kharkiv = RailwayStation.create(title: 'Khakiv')
lviv = RailwayStation.create(title: 'Lviv')
sumy = RailwayStation.create(title: 'Sumy')

kiev_kharkiv = Route.create(name: '', railway_station_ids: [kiev.id, lviv.id, kharkiv.id])
kiev_lviv = Route.create(name: '', railway_station_ids: [kiev.id, kharkiv.id, lviv.id])

train1 = Train.create(number: '1', current_station_id: kiev.id, route_id: kiev_kharkiv.id, sort: 0)
train2 = Train.create(number: '2', current_station_id: kharkiv.id, route_id: kiev_lviv.id)

economy_carriage1 = EconomyCarriage.create(number: '1', top_seats: 1, bottom_seats: 1, side_top_seats: 1, side_bottom_seats: 1, train_id: train1.id, type: 'EconomyCarriage')
economy_carriage2 = EconomyCarriage.create(number: '2', top_seats: 2, bottom_seats: 2, side_top_seats: 2, side_bottom_seats: 2, train_id: train2.id, type: 'EconomyCarriage')
coupe_carriage1 = CoupeCarriage.create(number: '3', top_seats: 3, bottom_seats: 3, train_id: train1.id, type: 'CoupeCarriage')
coupe_carriage2 = CoupeCarriage.create(number: '4', top_seats: 4, bottom_seats: 4, train_id: train2.id, type: 'CoupeCarriage')
sv_carriage1 = SVCarriage.create(number: '5', bottom_seats: 5, train_id: train1.id, type: 'SVCarriage')
sv_carriage2 = SVCarriage.create(number: '6', bottom_seats: 6, train_id: train2.id, type: 'SVCarriage')
seated1 = SeatedCarriage.create(number: '7', seats: 7, train_id: train1.id, type: 'SeatedCarriage')
seated2 = SeatedCarriage.create(number: '8', seats: 8, train_id: train2.id, type: 'SeatedCarriage')
