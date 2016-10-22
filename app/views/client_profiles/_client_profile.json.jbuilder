json.extract! client_profile, :id, :client_id, :name, :bio, :created_at, :updated_at
json.url client_profile_url(client_profile, format: :json)