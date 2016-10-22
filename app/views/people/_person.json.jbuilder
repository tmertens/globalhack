json.extract! person, :id, :client_id, :first_name, :last_name, :date_of_birth, :gender, :created_at, :updated_at
json.url person_url(person, format: :json)