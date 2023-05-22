class BookAuthor < ApplicationRecord
  include Randomizable

  belongs_to :book
  belongs_to :author
end
