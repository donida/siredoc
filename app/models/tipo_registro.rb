class TipoRegistro < ActiveRecord::Base
  validates_presence_of :chave, :nome
end
