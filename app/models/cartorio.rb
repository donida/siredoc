class Cartorio < ActiveRecord::Base
  belongs_to :atribuicao
  belongs_to :comarca
  belongs_to :cidade
  validates_presence_of :nome, :atribuicao_id, :comarca_id, :cidade_id, :codigo, :nome, :rua, :numero 
end
