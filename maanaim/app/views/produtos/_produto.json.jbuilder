json.extract! produto, :id, :nome, :preco, :ativo, :obs, :created_at, :updated_at
json.url produto_url(produto, format: :json)
