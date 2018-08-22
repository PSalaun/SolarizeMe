# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts "Erasing database"

Project.delete_all
User.delete_all

puts "generating admin"

User.create( email: "admin@admin.com", password: 123456, admin: true )

puts "generating investors"
20.times do
  User.create(
    email: Faker::Internet.email,
    password: 123456,
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(17, 70),
    is_company: false,
    company_name: nil
    )
end

puts "generating companies"
5.times do
  User.create(
    email: Faker::Internet.email,
    password: 123456,
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(17, 70),
    is_company: true,
    company_name: Faker::Company.name
    )
end

puts "created #{User.count} users"

puts "generating projects"
5.times do
  project = Project.new(
    name: Faker::Nation.capital_city,
    price_per_panel: 250,
    price_cents: 25000,
    yield: 0.079,
    start_date: Faker::Date.between(100.days.ago, Date.today),
    end_date: Faker::Date.forward(23),
    panels_quantity: 1 + rand(50),
    # panels_quantity: 100 + rand(1000),
    country: Faker::Nation.nationality,
    company_logo_name: Faker::DragonBall.character
    )
  project.user = User.first
  project.save!
end

puts "created #{Project.count} projects"


