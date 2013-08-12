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

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['cartorios.nome like :search OR bairro like :search OR email like :search OR rua like :search OR cidades.nome like :search OR atribuicaos.nome like :search OR tipo_Registros.nome like :search', {:search => "%#{search}%"}],
             :joins => [:cidade, 'LEFT JOIN atribuicaos_cartorios ON atribuicaos_cartorios.cartorio_id = cartorios.id', 'LEFT JOIN atribuicaos ON atribuicaos.id = atribuicaos_cartorios.atribuicao_id', 'LEFT JOIN tipo_Registros ON atribuicaos."tipoRegistro_id" = tipo_Registros.id'],
             :order => 'nome'
  end
  
end
