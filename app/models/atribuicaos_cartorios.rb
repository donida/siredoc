class AtribuicaosCartorios < ActiveRecord::Base
  belongs_to :cartorio
  belongs_to :atribuicao
end
