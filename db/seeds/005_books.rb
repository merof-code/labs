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

puts 'seeding books'
1000.times do
  Book.create(
    name: Faker::Book.title,
    genre: Faker::Book.genre,
    number_of_pages: rand(1..1000),
    language: Faker::Nation.language,
    synopsis: 'lol',
    published_at: generate_random_date_years_ago(300),
    publisher: Publisher.random
  )
end

puts 'seeding book authors'
Book.all.each do |book|
  author_count = rand(1..5)
  author_count.times do
    BookAuthor.create(
      book:,
      author: Author.random
    )
  end
end