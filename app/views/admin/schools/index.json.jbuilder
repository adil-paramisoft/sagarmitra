json.array!(@schools) do |school|
  json.extract! school, :address, :school_type_id, :program_state_id, :total_students, :medium_id
  json.url school_url(school, format: :json)
end
