Book.delete_all
User.delete_all
Role.delete_all
Department.delete_all
%w[Student Librarian Admin].each do |r|
  Role.create(name: r)
end

%w[Students Librarians Admins].each do |r|
  Department.create(name: r)
end