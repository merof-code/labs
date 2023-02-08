json.extract! borrow, :id, :Book_id, :user_id, :approver_id, :return_inspector_id, :borrow_date, :return_date, :returned_at, :cost, :comments, :created_at, :updated_at
json.url borrow_url(borrow, format: :json)
