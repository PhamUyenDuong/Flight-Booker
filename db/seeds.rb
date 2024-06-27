# db/seeds.rb

require 'faker'

Airport.destroy_all
Flight.destroy_all

airports = ["SFO", "NYC", "LAX", "ORD", "DFW"].map do |code|
  Airport.create!(code: code)
end

# Create some sample flights
airports.combination(2).each do |departure, arrival|
  3.times do
    Flight.create!(
      departure_airport: departure,
      arrival_airport: arrival,
      start_datetime: Faker::Time.forward(days: 30),
      duration: rand(1..6) * 60
    )
  end
end
