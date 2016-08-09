json.array!(@research_areas) do |research_area|
  json.extract! research_area, :id, :name
end
