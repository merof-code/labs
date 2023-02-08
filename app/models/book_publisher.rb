class BookPublisher < ApplicationRecord
  belongs_to :book_title
  belongs_to :Publisher
end
