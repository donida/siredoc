class CreateComarcas < ActiveRecord::Migration
  def change
    create_table :comarcas do |t|
      t.string :nome, :null => false
      t.integer :chave, :null => false

      t.timestamps
    end
    add_index :comarcas, :nome, unique: true
    add_index :comarcas, :chave, unique: true
  end
end
