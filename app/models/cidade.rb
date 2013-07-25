class Cidade < ActiveRecord::Base
  belongs_to :estado
  belongs_to :comarca
  validates_presence_of :nome, :estado_id
end
