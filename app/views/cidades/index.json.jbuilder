json.array!(@cidades) do |cidade|
  json.extract! cidade, :nome, :sigla, :estado_id
  json.url cidade_url(cidade, format: :json)
end
