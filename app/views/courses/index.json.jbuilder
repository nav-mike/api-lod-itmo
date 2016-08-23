json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :link, :teacher
end
