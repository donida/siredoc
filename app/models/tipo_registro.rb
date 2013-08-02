class TipoRegistro < ActiveRecord::Base
  validates_presence_of :chave, :nome
  has_many :atribuicaos
end
