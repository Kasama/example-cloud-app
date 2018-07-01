json.extract! paciente, :id, :CPF, :NOME, :ENDERECO, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
