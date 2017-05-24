json.extract! datos_persona, :id, :name, :country, :city, :receive_email, :created_at, :updated_at
json.url datos_persona_url(datos_persona, format: :json)
