json.array!(@program_states) do |program_state|
  json.extract! program_state, :name, :description
  json.url program_state_url(program_state, format: :json)
end
