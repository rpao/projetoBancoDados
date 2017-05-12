json.extract! tipo_evento, :id, :nome, :ativo, :dtCadastro, :created_at, :updated_at
json.url tipo_evento_url(tipo_evento, format: :json)
