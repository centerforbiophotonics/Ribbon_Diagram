json.array!(@user_diagrams) do |user_diagram|
  json.extract! user_diagram, :id, :user_id, :diagram_id
  json.url user_diagram_url(user_diagram, format: :json)
end
