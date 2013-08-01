class Comarca < ActiveRecord::Base
  belongs_to :cidade
  validates_presence_of :nome, :chave, :cidade_id
end
