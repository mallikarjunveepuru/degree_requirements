json.array!(@courses) do |course|
  json.extract! course, :id, :name, :hours
  json.url course_url(course, format: :json)
end
