json.extract! project, :id, :name, :date, :description, :featured, :url, :category_id, :created_at, :updated_at
json.url project_url(project, format: :json)
