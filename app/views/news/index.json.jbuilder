json.array!(@news) do |news|
  json.extract! news, :id, :title, :content, :published_at, :address
end
