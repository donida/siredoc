class Estado < ActiveRecord::Base
  validates_presence_of :nome, :sigla
  has_many :cidades
end
