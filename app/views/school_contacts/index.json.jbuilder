json.array!(@school_contacts) do |school_contact|
  json.extract! school_contact, :school_id, :user_id, :schoold_role_id
  json.url school_contact_url(school_contact, format: :json)
end
