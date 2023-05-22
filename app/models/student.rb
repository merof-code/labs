class Student < User
  has_one :student_info, class_name: "StudentInfo", foreign_key: "user_id"
end