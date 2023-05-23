class Borrow < ApplicationRecord
  belongs_to :physical_book
  belongs_to :user
  belongs_to :approver, class_name: "Librarian"
  belongs_to :return_inspector, class_name: "Librarian"

  # returns books borrowed in date range
  scope :borrowed_at, ->(date_from, date_to) {
    where(
      "(
        (returned_at IS NOT NULL AND (:date_from NOT BETWEEN borrow_date AND returned_at)
          AND (:date_to NOT BETWEEN borrow_date AND returned_at)) OR
        (returned_at IS NULL AND (:date_from NOT BETWEEN borrow_date AND scheduled_return_date)
          AND (:date_to NOT BETWEEN borrow_date AND scheduled_return_date))
      )",
      date_from: date_from,
      date_to: date_to
    )
  }
end
