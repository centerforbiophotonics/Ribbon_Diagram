json.array!(@users) do |user|
  json.extract! user, :id, :institution_id, :access_level, :access_level_desc, :name, :email
  json.url user_url(user, format: :json)
end
