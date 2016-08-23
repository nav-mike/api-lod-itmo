json.extract! @course, :name, :description, :link
json.teacher Person.find(@course.teacher[/\d+\z/]).name