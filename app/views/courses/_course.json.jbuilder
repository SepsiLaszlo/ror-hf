json.extract! course, :id, :subject_id, :course_type_id, :created_at, :updated_at
json.url course_url(course, format: :json)
