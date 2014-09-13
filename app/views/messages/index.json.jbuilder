json.array!(@messages) do |message|
  json.extract! message, :id, :body, :to_user, :from_user
  json.url message_url(message, format: :json)
end
