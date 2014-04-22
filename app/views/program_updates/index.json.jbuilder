json.array!(@program_updates) do |program_update|
  json.extract! program_update, :update_text, :from
  json.url program_update_url(program_update, format: :json)
end
