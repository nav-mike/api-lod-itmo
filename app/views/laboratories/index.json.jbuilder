json.array!(@laboratories) do |lab|
  json.extract! lab, :id, :en_name, :ru_name, :web_page, :country
end