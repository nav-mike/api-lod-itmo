class Event < ActiveRecord::Base
  validates :title, length: {in: 2..100}

  validates :address, length: {in: 2..150}
end
