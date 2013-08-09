class Atribuicao < ActiveRecord::Base
  belongs_to :tipoRegistro
  has_and_belongs_to_many :cartorios
  validates_presence_of :nome, :chave, :tipoRegistro_id
end
