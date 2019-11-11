json.extract! invitation, :id, :user_id, :accept, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
