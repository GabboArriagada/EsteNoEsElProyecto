json.extract! asignatura, :id, :nombre, :año, :curso_id, :created_at, :updated_at
json.url asignatura_url(asignatura, format: :json)
