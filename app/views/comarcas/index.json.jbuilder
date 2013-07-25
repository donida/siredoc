json.array!(@comarcas) do |comarca|
  json.extract! comarca, :nome, :chave
  json.url comarca_url(comarca, format: :json)
end
