json.array!(@competitions) do |competition|
  json.extract! competition, :id, :title, :description, :prize, :deadline
  json.url competition_url(competition, format: :json)
end
