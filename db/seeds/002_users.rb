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

def create_user(type)
  User.create(
    nickname: Faker::Internet.unique.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.middle_name,
    email: Faker::Internet.email,
    role: Role.find_by(name: type),
    start_date: generate_random_date_years_ago,
    department: Department.find_by(name: type.pluralize),
    password: User.random_password,
    type: type
  )
end

puts 'seeding students'
100.times do
  create_user('Student')
end

puts 'seeding Librarians'
10.times do
  create_user('Librarian')
end

puts 'seeding admin'
User.create(
  nickname: 'admin',
  first_name: 'fi',
  last_name: 'la',
  middle_name: 'mi',
  email: 'admin@example.com',
  role: Role.find_by(name: 'Admin'),
  start_date: DateTime.now,
  department: Department.find_by(name: 'Admins'),
  password: '1234567890qwe'
)