json.array!(@cartorios) do |cartorio|
  json.extract! cartorio, :codigo, :nome, :atribuicao_id, :comarca_id, :cidade_id, :bairro, :rua, :numero, :complemento, :cep, :telefone, :celular, :email, :historico
  json.url cartorio_url(cartorio, format: :json)
end
