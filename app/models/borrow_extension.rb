class BorrowExtension < ApplicationRecord
  belongs_to :Borrow
  belongs_to :ExtensionReason
end
