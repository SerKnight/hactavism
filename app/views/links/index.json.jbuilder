json.array!(@links) do |link|
  json.extract! link, :content, :tags
  json.url link_url(link, format: :json)
end