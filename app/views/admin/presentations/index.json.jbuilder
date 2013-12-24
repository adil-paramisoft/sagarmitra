json.array!(@presentations) do |presentation|
  json.extract! presentation, :presented_by, :date, :audience_count, :summary, :authorities_present, :presentation_type_id, :school_id, :followup_volunteer, :followup_volunteer_mno
  json.url presentation_url(presentation, format: :json)
end
