json.array!(@cidades) do |cidade|
  json.extract! cidade, :nome, :sigla, :estado_id, :comarca_id
  json.url cidade_url(cidade, format: :json)
end
