json.extract! author, :id, :photo, :first_name, :last_name, :middle_name, :dob, :death, :created_at, :updated_at
json.url author_url(author, format: :json)
