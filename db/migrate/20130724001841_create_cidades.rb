class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome, :null => false
      t.string :sigla
      t.references :estado, index: true, :null => false
      t.references :comarca, index: true

      t.timestamps
    end
    add_index :cidades, :nome
    add_index :cidades, :sigla
  end
end
