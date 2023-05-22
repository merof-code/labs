class TeacherInfo < ApplicationRecord
  belongs_to :user
  belongs_to :facultie
end
