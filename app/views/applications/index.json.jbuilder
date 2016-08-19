json.array!(@applications) do |application|
  json.extract! application, :id, :name, :description, :link, :key
end
