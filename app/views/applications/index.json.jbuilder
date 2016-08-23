json.array!(@applications) do |application|
  json.extract! application, :name, :description, :link, :key
end
