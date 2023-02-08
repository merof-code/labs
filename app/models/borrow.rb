class Borrow < ApplicationRecord
  belongs_to :Book
  belongs_to :user
end
