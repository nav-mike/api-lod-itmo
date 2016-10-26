json.array!(@publications) do |bib|
  json.extract! bib, :title, :link
end
