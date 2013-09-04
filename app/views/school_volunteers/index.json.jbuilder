json.array!(@school_volunteers) do |school_volunteer|
  json.extract! school_volunteer, :school_name, :school_address, :user_id, :school_medium_id, :no_of_students, :volunteer, :school_type_id, :mobile
  json.url school_volunteer_url(school_volunteer, format: :json)
end
