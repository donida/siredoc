json.array!(@tipo_registros) do |tipo_registro|
  json.extract! tipo_registro, :nome, :chave
  json.url tipo_registro_url(tipo_registro, format: :json)
end
