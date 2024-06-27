# db/seeds.rb

# Clear existing data
Airport.destroy_all
Flight.destroy_all

# Create some airports
sfo = Airport.create(code: "SFO")
nyc = Airport.create(code: "NYC")
lax = Airport.create(code: "LAX")
chi = Airport.create(code: "CHI")

# Create some flights
Flight.create(departure_airport: sfo, arrival_airport: nyc, start_datetime: DateTime.now + 1.day, duration: 360)
Flight.create(departure_airport: nyc, arrival_airport: lax, start_datetime: DateTime.now + 2.days, duration: 300)
Flight.create(departure_airport: chi, arrival_airport: sfo, start_datetime: DateTime.now + 3.days, duration: 420)
Flight.create(departure_airport: lax, arrival_airport: chi, start_datetime: DateTime.now + 4.days, duration: 240)
Flight.create(departure_airport: nyc, arrival_airport: sfo, start_datetime: DateTime.now + 5.days, duration: 360)

puts "Seeded #{Airport.count} airports and #{Flight.count} flights."
