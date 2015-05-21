json.array!(@edges) do |edge|
  json.extract! edge, :id, :child_id, :parent_id, :child_klass
  json.url edge_url(edge, format: :json)
end
