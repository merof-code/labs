10.times do
  Group.create(name: Faker::Educator.course_name)
end

Student.all.each do |s|
  next unless s.student_info.nil? 

  s_info = StudentInfo.create(
    year: Faker::Date.between(from: 10.years.ago, to: DateTime.now).year,
    group: Group.random
  )
  puts "failed to create student info bc #{s_info.errors.first}" unless s_info.persisted?
  s.student_info = s_info
  puts "failed to save #{s.id}" unless s.save
end

# group_id
