class Atribuicao < ActiveRecord::Base
  belongs_to :tipoRegistro
  validates_presence_of :nome, :chave, :tipoRegistro_id
end
