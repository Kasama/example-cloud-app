json.extract! medico, :id, :CPF, :CRM, :NOME, :ENDERECO, :created_at, :updated_at
json.url medico_url(medico, format: :json)
