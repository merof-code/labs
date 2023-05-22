puts 'seeding authors'
100.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.middle_name
  )
end
