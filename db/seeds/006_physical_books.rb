# create random date between today - =yers_ago= to now
def generate_random_date_years_ago(years_ago = 3)
  from = DateTime.now - (years_ago * 365) # Subtracting 3 years in days
  to = DateTime.now
  generate_random_date(from:, to:)
end

# create random date from given date to now
def generate_random_date(from:, to:)
  random_seconds = rand((from.to_time.to_i)..(to.to_time.to_i))
  DateTime.strptime(random_seconds.to_s, '%s')
end

puts 'seeding physical books'
Book.all.each do |book|
  next if rand < 0.5 # magic for bool

  rand(1..10).times do
    PhysicalBook.create(
      book:,
      bought: generate_random_date_years_ago(50),
      monetary_value: rand(10.1000).to_f / 100
    )
  end
end
