json.array!(@school_plastic_collection_sources) do |school_plastic_collection_source|
  json.extract! school_plastic_collection_source, :schoold_id, :plastic_collection_source
  json.url school_plastic_collection_source_url(school_plastic_collection_source, format: :json)
end
