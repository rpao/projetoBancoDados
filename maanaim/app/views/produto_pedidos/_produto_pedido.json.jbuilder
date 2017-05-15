json.extract! produto_pedido, :id, :pedido_id, :produto_id, :created_at, :updated_at
json.url produto_pedido_url(produto_pedido, format: :json)
