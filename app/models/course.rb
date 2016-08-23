class Course < ActiveRecord::Base
  validates :name, length: {in: 2..100}

  validates :description, length: {in: 0..200}

  validates :link, length: {in: 0..100}

  validates :teacher, length: {in: 100}
end
