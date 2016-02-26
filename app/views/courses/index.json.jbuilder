json.array!(@courses) do |course|
  json.extract! course, :id, :name, :initials
  json.url course_url(course, format: :json)
end
