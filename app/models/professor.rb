class Professor < User
  has_one :professor_info, class_name: 'TeachersInfo', foreign_key: 'user_id'
end
