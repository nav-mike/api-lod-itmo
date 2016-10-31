class Statistic < ActiveRecord::Base
  def self.update_count(key, dataset)
    s = where(app_key: key, dataset: dataset).first_or_create!
    s.requests_count += 1
    s.save!
  end
end
