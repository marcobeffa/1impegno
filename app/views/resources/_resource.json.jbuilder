json.extract! resource, :id, :user_id, :tipo, :nome, :descrizione, :body, :img_url, :email, :telefono, :costo, :ricavo, :data, :visibility, :energy, :importanza, :created_at, :updated_at
json.url resource_url(resource, format: :json)
