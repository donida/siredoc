class Atribuicao < ActiveRecord::Base
  belongs_to :tipoCartorio
  validates_presence_of :nome, :chave, :tipoRegistro_id
end
