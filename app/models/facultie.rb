class Facultie < ApplicationRecord
  belongs_to :department
  has_many :groups, through: :facultie_group
  has_many :facultie_groups
  has_many :teacher_infos
end
