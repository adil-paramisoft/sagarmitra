json.array!(@plastic_collection_sources) do |plastic_collection_source|
  json.extract! plastic_collection_source, :name, :address, :contact_person, :phone_no_1, :phone_no_2, :website, :eamil
  json.url plastic_collection_source_url(plastic_collection_source, format: :json)
end
