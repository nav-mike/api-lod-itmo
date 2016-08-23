class Application < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, length: {in: 2..32}

  validates :description, length: {in: 0..200}

  validates :link, length: {in: 0..100}

  validates :key, uniqueness: true
  validates :key, length: {in: 10..20}
  validates :key, format: {with: /\A[a-zA-Z0-9]+\z/}
end
