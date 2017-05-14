json.extract! pessoa, :id, :cpf, :nome, :sexo, :dtNasc, :logradouro, :cep, :bairro, :email, :telefone, :ativo, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
