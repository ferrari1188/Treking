# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Notification.destroy_all
Journey.destroy_all
Waypoint.destroy_all
Route.destroy_all
User.destroy_all

emails = ['phenela.luengo@gmail.com', 'hester25194@gmail.com', 'chi.ferr.1188@gmail.com', 'benwest0291@outlook.com']
emails.each do |email|
  user = User.new(
    email: email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "password"
  )
  user.save!
end

puts "new users created"

route = Route.new(
  user: User.all.sample,
  description: "Manhattan walk",
  name: "Manhattan",
  start_location: "East End",
  end_location: "West End"
)
route.save

puts "Routes created"

first_waypoint = Waypoint.new(
  route_id: route.id,
  longitude: -73.99637976652599,
  latitude: 40.73219303109434,
  sequence: 1
)
first_waypoint.save

second_waypoint = Waypoint.new(
  route_id: route.id,
  longitude: -73.9941734075301,
  latitude: 40.73527861299419,
  sequence: 2
)
second_waypoint.save

third_waypoint = Waypoint.new(
  route_id: route.id,
  longitude: -73.9876192234535,
  latitude: 40.732598713378934,
  sequence: 3
)
third_waypoint.save

fourth_waypoint = Waypoint.new(
  route_id: route.id,
  longitude: -73.9895011178912,
  latitude: 40.73010311346752,
  sequence: 4
)
fourth_waypoint.save

fifth_waypoint = Waypoint.new(
  route_id: route.id,
  longitude: -73.99636354329823,
  latitude: 40.73215615076427,
  sequence: 5
)
fifth_waypoint.save

puts "Waypoints created"

Route.find(params[:id])
Waypoint.where(route_id: params[:id]).sort
# ?order by
# populate array with coordinates
# write the mapbox url
