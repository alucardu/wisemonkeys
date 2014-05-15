json.array!(@reviews) do |review|
  json.extract! review, :id, :name, :feedback
  json.url review_url(review, format: :json)
end
