# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
%w[Student Librarian Admin].each do |r|
  Role.create(name: r)
end
puts Role.all

%w[Students Librarians Admins].each do |r|
  Department.create(name: r)
end
puts Department.all

users = User.create(
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
puts User.all
