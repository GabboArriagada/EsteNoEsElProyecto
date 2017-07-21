json.extract! curso, :id, :nombre, :año, :created_at, :updated_at
json.url curso_url(curso, format: :json)
