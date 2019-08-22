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

train1 = Train.create(number: '1', current_station_id: kiev.id, route_id: kiev_kharkiv.id)
train2 = Train.create(number: '2', current_station_id: kharkiv.id, route_id: kiev_lviv.id)
