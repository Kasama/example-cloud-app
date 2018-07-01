json.extract! receita, :id, :DATA, :DESCRICAO, :prontidao, :created_at, :updated_at
json.url receita_url(receita, format: :json)
