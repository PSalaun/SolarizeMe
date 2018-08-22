require 'faker'

puts "Erasing database"

Project.delete_all
User.delete_all
Investment.delete_all

puts "generating admin"

User.create( email: "admin@admin.com", password: 123456, admin: true )

puts "generating investors"
User.create(
  email: "john@doe.com",
  password: 123456,
  username: "johndoe",
  first_name: "John",
  last_name: "Doe",
  birth_date: Faker::Date.birthday(17, 70),
  is_company: false,
  company_name: nil
  )

User.create(
  email: "jane@doe.com",
  password: 123456,
  username: "janedoe",
  first_name: "Jane",
  last_name: "Doe",
  birth_date: Faker::Date.birthday(17, 70),
  is_company: false,
  company_name: nil
  )

puts "generating companies"
User.create(
  email: "cocacola@company.com",
  password: 123456,
  username: "cocacola",
  first_name: nil,
  last_name: nil,
  birth_date: nil,
  is_company: true,
  company_name: "Coca-Cola"
  )

User.create(
  email: "monsanto@company.com",
  password: 123456,
  username: "monsanto",
  first_name: nil,
  last_name: nil,
  birth_date: nil,
  is_company: true,
  company_name: "Monsato"
  )

puts "created #{User.count} users"

puts "generating projects"

current_campaign = Project.new(
  name: "Coca Cola Roma",
  price_cents: 25000,
  yield: 0.051,
  crowdfunding_start_date: Date.new(2018, 7, 23),
  crowdfunding_end_date: Date.new(2018, 9, 22),
  end_of_contract: Date.new(2038, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 1200,
  country: "Italy"
  )
current_campaign.user = User.where(company_name: "Coca-Cola").first
current_campaign.save!

future_campaign = Project.new(
  name: "Coca Cola Bari",
  price_cents: 40000,
  yield: 0.082,
  crowdfunding_start_date: Date.new(2018, 10, 2),
  crowdfunding_end_date: Date.new(2018, 11, 1),
  end_of_contract: Date.new(2035, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 800,
  country: "Italy"
  )
future_campaign.user = User.where(company_name: "Coca-Cola").first
future_campaign.save!

running_coca = Project.new(
  name: "Coca Cola Madrid",
  price_cents: 30000,
  yield: 0.062,
  crowdfunding_start_date: Date.new(2018, 1, 2),
  crowdfunding_end_date: Date.new(2018, 2, 20),
  end_of_contract: Date.new(2030, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 2000,
  country: "Spain"
  )
running_coca.user = User.where(company_name: "Coca-Cola").first
running_coca.save!

running_Monsato = Project.new(
  name: "Monsato Paris",
  price_cents: 60000,
  yield: 0.042,
  crowdfunding_start_date: Date.new(2017, 10, 2),
  crowdfunding_end_date: Date.new(2017, 11, 1),
  end_of_contract: Date.new(2038, 1, 31),
  comissioning_date: Date.new(2018, 1, 31),
  panels_quantity: 200,
  country: "France"
  )
running_Monsato.user = User.where(company_name: "Monsato").first
running_Monsato.save!

puts "created #{Project.count} projects"

puts "generating investments"

investment = Investment.new(
  number_of_panels: 50,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Coca Cola Roma").first
investment.save!

investment = Investment.new(
  number_of_panels: 10,
  state: "confirmed"
  )
investment.user = User.where(username: "janedoe").first
investment.project = Project.where(name: "Coca Cola Roma").first
investment.save!

investment = Investment.new(
  number_of_panels: 200,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Monsato Paris").first
investment.save!

investment = Investment.new(
  number_of_panels: 5,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Coca Cola Madrid").first
investment.save!

puts "created #{Investment.count} investments"
