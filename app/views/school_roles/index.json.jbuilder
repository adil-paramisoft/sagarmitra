json.array!(@school_roles) do |school_role|
  json.extract! school_role, :role, :description
  json.url school_role_url(school_role, format: :json)
end
