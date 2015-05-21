json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :name, :hours, :take
  json.url requirement_url(requirement, format: :json)
end
