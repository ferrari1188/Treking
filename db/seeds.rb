# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Route.destroy_all
Notification.destroy_all
Journey.destroy_all

emails = ['phenela.luengo@gmail.com', 'hester25194@gmail.com', 'chi.ferr.1188@gmail.com', 'benwest0291@outlook.com']
emails.each do |email|
  user = User.new(
    email: email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Team.name.strip,
    password: "password"
  )
  user.save
end

puts "new users created"
