json.array!(@businessrequests) do |businessrequest|
  json.extract! businessrequest, :id, :kvk, :company, :phone, :request
  json.url businessrequest_url(businessrequest, format: :json)
end
