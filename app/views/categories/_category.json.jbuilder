json.extract!  category, :id, :name, :state, :created_at, :updated_at
json.url category_url(category, format: :json)
