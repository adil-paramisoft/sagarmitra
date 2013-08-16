json.array!(@school_types) do |school_type|
  json.extract! school_type, :name, :description
  json.url school_type_url(school_type, format: :json)
end
