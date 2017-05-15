json.extract! evento, :id, :quantidade_de_vagas, :data_de_inicio, :data_de_fim, :tipo_evento_id, :created_at, :updated_at
json.url evento_url(evento, format: :json)
