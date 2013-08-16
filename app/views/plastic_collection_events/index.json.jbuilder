json.array!(@plastic_collection_events) do |plastic_collection_event|
  json.extract! plastic_collection_event, :plastic_weight, :money_given, :volunteers_present, :plastic_collection_agency_id, :date, :quality_remark, :feedback, :school_id
  json.url plastic_collection_event_url(plastic_collection_event, format: :json)
end
