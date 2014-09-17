json.array!(@reviews) do |review|
  json.extract! review, :id, :text, :rating, :car_wash_id
  json.url car_wash_review_url(review, format: :json)
end
