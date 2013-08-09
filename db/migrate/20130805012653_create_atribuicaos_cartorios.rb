class CreateAtribuicaosCartorios < ActiveRecord::Migration
  def change
    create_table :atribuicaos_cartorios do |t|
      t.belongs_to :cartorio, index: true
      t.belongs_to :atribuicao, index: true
    end
  end
end
