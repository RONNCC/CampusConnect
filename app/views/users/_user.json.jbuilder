json.extract! user, :id, :username, :password_digest, :role, :first_name, :last_name, :phone, :email, :created_at, :updated_at
json.url user_url(user, format: :json)