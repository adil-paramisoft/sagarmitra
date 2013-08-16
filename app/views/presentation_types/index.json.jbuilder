json.array!(@presentation_types) do |presentation_type|
  json.extract! presentation_type, :name, :description
  json.url presentation_type_url(presentation_type, format: :json)
end
