json.array!(@navs) do |nav|
  json.extract! nav, :id, :name, :path, :image_url, :hidden-xs
  json.url nav_url(nav, format: :json)
end
