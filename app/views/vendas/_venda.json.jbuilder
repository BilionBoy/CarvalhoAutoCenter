json.extract! venda, :id, :descricao, :valor, :data, :user_id, :created_at, :updated_at
json.url venda_url(venda, format: :json)
