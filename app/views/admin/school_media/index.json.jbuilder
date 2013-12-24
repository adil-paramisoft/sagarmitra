json.array!(@school_media) do |school_medium|
  json.extract! school_medium, :name, :description
  json.url school_medium_url(school_medium, format: :json)
end
