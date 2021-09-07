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

peak = Route.new(
  user: User.all.sample,
  description: "Jacob's Ladder Loop from Edale",
  name: "Edale Rocks",
  latitude: 53.364507286303024,
  longitude: -1.817374775658692,
  route_image_url: "https://i.ibb.co/YcZrC2Q/peak-district-map.png",
  time: "4 hours, 7 minutes",
  length: "7.98 mi",
  location_category: "Peak District"
)
peak.save

lake = Route.new(
  user: User.all.sample,
  description: "View to Keswick from Cat Bells Loop from Stair",
  name: "Catbells",
  latitude: 54.567520,
  longitude: -3.162795,
  time: "2 hours, 43 minutes",
  length: "5.19 mi",
  location_category: "Lake District"
)
lake.save

scotland = Route.new(
  user: User.all.sample,
  description: "Ben Nevis Mountain Path Loop from Glen Nevis",
  name: "Ben Nevis",
  latitude: 56.79685,
  longitude: -5.003508,
  time: "8 hours, 20 minutes",
  length: "11.1 mi",
  location_category: "Scottish Highlands"
)
scotland.save

snowdonia = Route.new(
  user: User.all.sample,
  description: "View down to the lakes Loop from Llanberis",
  name: "Snowdonia",
  latitude: 53.068497,
  longitude: -4.076231,
  time: "4 hours, 53 minutes",
  length: "7.49 mi",
  location_category: "Wales"
)
snowdonia.save

ireland = Route.new(
  user: User.all.sample,
  description: "Slieve Binnian Summit Loop from Annalong",
  name: "View of the Mourne Mountains",
  latitude: 54.166667,
  longitude: -6.083333,
  time: "3 hours, 51 minutes",
  length: "6.99 mi",
  location_category: "Northern Ireland"
)
ireland.save

new_forest = Route.new(
  user: User.all.sample,
  description: "Start of the Tall Trees Walk Loop from Sway",
  name: "Arboretum",
  latitude: 50.875875,
  longitude: -1.632772,
  time: "3 hours, 34 minutes",
  length: "8.53 mi",
  location_category: "New Forest"
)
new_forest.save

puts "Routes created"

peak_coordinates = [
  # route1
  {
    longitude: -1.817374775658692,
    latitude: 53.364507286303024
    # coordinates route1 -waypoint1
  }, {
    longitude: -1.8169447892250332,
    latitude: 53.37061578983253
    # coordinates route1 -waypoint2
  }, {
    longitude: -1.8179850067283212,
    latitude: 53.3741374461473
  }, {
    longitude: -1.820757603715208,
    latitude: 53.37853643846918
  }, {
    longitude: -1.8224199161511194,
    latitude: 53.380176859387944
  }, {
    longitude: -1.838266182156957,
    latitude: 53.38212656847614
  }, {
    longitude: -1.8406065328437364,
    latitude: 53.38196279616014
  }, {
    longitude: -1.8458643075043142,
    latitude: 53.38077926311837
  }, {
    longitude: -1.8587856253182622,
    latitude: 53.38201178937979
  }, {
    longitude: -1.8659706946866663,
    latitude: 53.379789696817454
  }, {
    longitude: -1.869238028838197,
    latitude: 53.37939506457417
  }, {
    longitude: -1.8785678841042,
    latitude: 53.3781625413061
  }, {
    longitude: -1.8822132602943782,
    latitude: 53.37773567728078
  }, {
    longitude: -1.8820189186178595,
    latitude: 53.37398745617102
  }, {
    longitude: -1.871278448332589,
    latitude: 53.373015281621235
  }, {
    longitude: -1.8694078545185846,
    latitude: 53.372724149742936
  }, {
    longitude: -1.8599735954794312,
    latitude: 53.36830840594999
  }, {
    longitude: -1.8550938211750463,
    latitude: 53.36614889395415
  }, {
    longitude: -1.8464677741847026,
    latitude: 53.36485409501344
  }, {
    longitude: -1.8344742353085337,
    latitude: 53.366654689457874
  }, {
    longitude: -1.8168914656147024,
    latitude: 53.370714015468906
  }, {
    longitude: -1.8172878097056753,
    latitude: 53.36448998002262
  }
#   #  route2
#   [{
# #coordinates route2 waypoint 1
#    }]
]

peak_coordinates.each_with_index do |coordinate, index|
  waypoint = Waypoint.new(
    route_id: peak.id,
    longitude: coordinate[:longitude],
    latitude: coordinate[:latitude],
    sequence: index + 1
  )
  waypoint.save!
  puts "Waypoint #{waypoint.sequence} created! Longitude: #{waypoint.longitude}. Latitude: #{waypoint.latitude}."
end


puts "Waypoints created"
