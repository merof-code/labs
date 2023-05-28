class Group < ApplicationRecord
  include Randomizable
  validates_presence_of :name,  message: "can't be blank"
  has_one :facultie, through: :facultie_group
  has_many :student_infos
end
