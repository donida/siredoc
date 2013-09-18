
class Cartorio < ActiveRecord::Base
  belongs_to :comarca
  belongs_to :cidade
  has_and_belongs_to_many :atribuicaos
  validates_presence_of :nome, :comarca_id, :cidade_id, :nome, :rua, :numero
  validates :nome, length: { minimum: 10, maximum: 65 }
  validates :bairro, length: { minimum: 1, maximum: 40 }
  validates :rua, length: { minimum: 1, maximum: 48 }
  validates :cep, length: { minimum: 0, maximum: 9 }
  validates :telefone, length: { minimum: 0, maximum: 30 }
  validates :celular, length: { minimum: 0, maximum: 30 }
  validates :email, length: { minimum: 0, maximum: 150 }

  def self.search(nome, cidade_nome, atribuicao_nome, tipoRegistro_nome, comarca_nome, associado, page)
    filtro_associado = ''
    if associado != nil && associado != ''
      filtro_associado = ' and cartorios.associado = ' + associado
    end
    paginate :per_page => 10, :page => page,
             :select => "distinct cartorios.*",
             :conditions => ['lower(cartorios.nome) like :nome AND lower(cidades.nome) like :cidade_nome AND lower(atribuicaos.nome) like :atribuicao_nome AND lower(tipo_Registros.nome) like :tipoRegistro_nome AND lower(comarcas.nome) like :comarca_nome '+filtro_associado,
                             {
                                 :nome => "%#{nome}%".downcase,
                                 :cidade_nome => "%#{cidade_nome}%".downcase,
                                 :atribuicao_nome => "%#{atribuicao_nome}%".downcase,
                                 :tipoRegistro_nome => "%#{tipoRegistro_nome}%".downcase,
                                 :comarca_nome => "%#{comarca_nome}%".downcase
                             }],
             :joins => [:cidade, :comarca, 'LEFT JOIN atribuicaos_cartorios ON atribuicaos_cartorios.cartorio_id = cartorios.id', 'LEFT JOIN atribuicaos ON atribuicaos.id = atribuicaos_cartorios.atribuicao_id', 'LEFT JOIN tipo_Registros ON atribuicaos."tipoRegistro_id" = tipo_Registros.id'],
             :order => 'cartorios.nome'

  end
  
end
