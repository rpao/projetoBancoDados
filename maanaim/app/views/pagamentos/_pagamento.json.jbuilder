json.extract! pagamento, :id, :data, :account_id, :valor, :desconto, :forma_de_pagamento, :created_at, :updated_at
json.url pagamento_url(pagamento, format: :json)
