json.extract! user, :id, :nickname, :pfp, :email, :phone_number, :first_name, :last_name, :middle_name, :role_id, :department_id, :start_date, :end_date, :created_at, :updated_at
json.url user_url(user, format: :json)
