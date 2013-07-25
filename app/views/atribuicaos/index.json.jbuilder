json.array!(@atribuicaos) do |atribuicao|
  json.extract! atribuicao, :nome, :chave, :tipoRegistro_id
  json.url atribuicao_url(atribuicao, format: :json)
end
