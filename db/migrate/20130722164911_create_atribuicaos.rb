class CreateAtribuicaos < ActiveRecord::Migration
  def change
    create_table :atribuicaos do |t|
      t.string :nome, :null => false
      t.string :chave, :null => false
      t.references :tipoRegistro, index: true, :null => false

      t.timestamps
    end
    add_index :atribuicaos, :nome
    add_index :atribuicaos, :chave, unique: true
  end
end
