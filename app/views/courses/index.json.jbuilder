json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :link
  json.teacher Person.find(course.teacher[/\d+\z/]).name
end
