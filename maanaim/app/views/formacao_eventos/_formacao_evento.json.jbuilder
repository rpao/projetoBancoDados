json.extract! formacao_evento, :id, :pessoa_id, :data, :equipe_id, :evento_id, :created_at, :updated_at
json.url formacao_evento_url(formacao_evento, format: :json)
