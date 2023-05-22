class Group < ApplicationRecord
  has_one :facultie, through: :facultie_group
  has_many :student_infos
end
