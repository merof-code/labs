puts 'seeding publishers'
100.times do
  publisher_name = Faker::Book.publisher
  Publisher.create(
    name: publisher_name,
    email: Faker::Internet.email(name: publisher_name),
    website: Faker::Internet.url(host: publisher_name.downcase.gsub(' ', '') + '.com'),
    founded_year: Faker::Number.between(from: 1800, to: 2023),
    description: Faker::Lorem.paragraph(sentence_count: 2)
  )
end