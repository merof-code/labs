class PhysicalBook < ApplicationRecord
  include Randomizable

  belongs_to :book, class_name: "Book"
  has_many :borrows

  def borrow_days
    14
  end

  def available_for_borrow_at(from)
    available_at(from:, to: from + borrow_days)
  end

  def available_at(from:, to:)
    from, to = to, from if from > to
    borrows.borrowed_at(from, to).count.zero?
  end
end
