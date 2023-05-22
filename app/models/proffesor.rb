# STI user with professor_info (table: teacher_info) associated to it
class Professor < User
  has_one :professor_info, class_name: 'TeachersInfo', foreign_key: 'user_id'
end
