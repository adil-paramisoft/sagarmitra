json.array!(@program_volunteers) do |program_volunteer|
  json.extract! program_volunteer, :name, :interest, :responsibility, :email, :mobile
  json.url program_volunteer_url(program_volunteer, format: :json)
end
