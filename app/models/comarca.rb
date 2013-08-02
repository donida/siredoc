class Comarca < ActiveRecord::Base
  validates_presence_of :nome, :chave
end
