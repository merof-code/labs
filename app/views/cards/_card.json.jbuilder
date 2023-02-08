json.extract! card, :id, :user_id, :photo, :issuer_id, :active, :lost, :issue_date, :end_date, :created_at, :updated_at
json.url card_url(card, format: :json)
