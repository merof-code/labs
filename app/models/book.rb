class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :physical_books
  has_many :authors, through: :book_authors
end
