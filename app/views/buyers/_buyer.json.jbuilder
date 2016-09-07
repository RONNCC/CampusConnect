json.extract! buyer, :id, :user_id, :bio, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)