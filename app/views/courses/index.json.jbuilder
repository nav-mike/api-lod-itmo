json.array!(@courses) do |course|
  json.extract! course, :name, :description, :link, :teacher
end
