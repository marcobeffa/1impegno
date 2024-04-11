json.extract! content, :id, :tipo, :nome, :descrizione, :body, :img_url, :email, :telefono, :costo, :ricavo, :created_at, :updated_at
json.url content_url(content, format: :json)
