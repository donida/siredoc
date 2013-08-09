class Cartorio < ActiveRecord::Base
  belongs_to :comarca
  belongs_to :cidade
  has_and_belongs_to_many :atribuicaos
  validates_presence_of :nome, :comarca_id, :cidade_id, :nome, :rua, :numero
  validates :nome, length: { minimum: 10, maximum: 65 }
  validates :numero, length: { minimum: 1, maximum: 5 }
  validates :bairro, length: { minimum: 1, maximum: 65 }
  validates :rua, length: { minimum: 1, maximum: 254 }
  validates :complemento, length: { minimum: 0, maximum: 10 }
  validates :cep, length: { minimum: 0, maximum: 9 }
  validates :telefone, length: { minimum: 0, maximum: 30 }
  validates :celular, length: { minimum: 0, maximum: 30 }
  validates :email, length: { minimum: 0, maximum: 150 }
  
end
