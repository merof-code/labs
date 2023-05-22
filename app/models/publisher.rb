class Publisher < ApplicationRecord
  include Randomizable

  has_many :books
end
