require 'faker'

puts "Erasing database"

Project.delete_all
User.delete_all
Investment.delete_all
Output.delete_all

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
  company_name: "Monsanto"
  )

puts "created #{User.count} users"

puts "generating projects"

current_campaign = Project.new(
  name: "Rome Factory",
  description: "Excelent location with very reliable company!",
  price_cents: 25000,
  panel_watt: 270,
  lat: 52,
  lon: 25,
  kwh_price_cents: 21,
  yield: 0.151,
  roi_decimals: 412,
  crowdfunding_start_date: Date.new(2015, 7, 23),
  crowdfunding_end_date: Date.new(2015, 9, 22),
  comissioning_date: Date.new(2015, 12, 31),
  end_of_contract: Date.new(2038, 12, 31),
  panels_quantity: 1200,
  country: "Italy"
  )
current_campaign.user = User.where(company_name: "Coca-Cola").first
current_campaign.save!

future_campaign = Project.new(
  name: "Italy HQ",
  description: "Excelent location with very reliable company!",
  price_cents: 40000,
  panel_watt: 270,
  lat: 52,
  lon: 25,
  kwh_price_cents: 25,
  yield: 0.182,
  roi_decimals: 712,
  crowdfunding_start_date: Date.new(2018, 10, 2),
  crowdfunding_end_date: Date.new(2018, 11, 1),
  comissioning_date: Date.new(2018, 12, 31),
  end_of_contract: Date.new(2035, 12, 31),
  panels_quantity: 800,
  country: "Italy"
  )
future_campaign.user = User.where(company_name: "Coca-Cola").first
future_campaign.save!

running_coca = Project.new(
  name: "Madrid Depot",
  description: "Excelent location with very reliable company!",
  price_cents: 30000,
  panel_watt: 320,
  lat: 52,
  lon: 25,
  kwh_price_cents: 22,
  yield: 0.162,
  roi_decimals: 612,
  crowdfunding_start_date: Date.new(2018, 1, 2),
  crowdfunding_end_date: Date.new(2018, 10, 20),
  end_of_contract: Date.new(2030, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 2000,
  country: "Spain"
  )
running_coca.user = User.where(company_name: "Coca-Cola").first
running_coca.save!

running_Monsanto = Project.new(
  name: "Paris Offices",
  description: "Excelent location with very reliable company!",
  price_cents: 50000,
  panel_watt: 400,
  lat: 52,
  lon: 25,
  kwh_price_cents: 27,
  yield: 0.142,
  roi_decimals: 512,
  crowdfunding_start_date: Date.new(2017, 10, 2),
  crowdfunding_end_date: Date.new(2017, 11, 1),
  end_of_contract: Date.new(2038, 1, 31),
  comissioning_date: Date.new(2018, 1, 31),
  panels_quantity: 200,
  country: "France"
  )
running_Monsanto.user = User.where(company_name: "Monsanto").first
running_Monsanto.save!

puts "created #{Project.count} projects"

puts "generating investments"

investment = Investment.new(
  number_of_panels: 1000,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Rome Factory").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 200,
  state: "confirmed"
  )
investment.user = User.where(username: "janedoe").first
investment.project = Project.where(name: "Rome Factory").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 200,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Paris Offices").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 500,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Madrid Depot").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

puts "created #{Investment.count} investments"

puts "generating random outputs"

days = 0
1200.times do
  output = Output.new ()
  madrid = Project.where(name: "Rome Factory").first
  output.project = madrid
  output.quantity = madrid.panel_watt / 1000 * madrid.panels_quantity  * 5 * rand(1000) / 500
  output.date = Date.today - days
  days += 1
  output.save!
end

days = 0
365.times do
  output = Output.new ()
  madrid = Project.where(name: "Paris Offices").first
  output.project = madrid
  output.quantity = madrid.panel_watt / 1000 * madrid.panels_quantity  * 5 * rand(1000) / 500
  output.date = Date.today - days
  days += 1
  output.save!
end

puts "generated #{Output.count} outputs"


