class CreateCartorios < ActiveRecord::Migration
  def change
    create_table :cartorios do |t|
      t.integer :codigo
      t.string :nome
      t.references :comarca, index: true
      t.references :cidade, index: true
      t.string :bairro
      t.string :rua
      t.integer :numero
      t.string :complemento
      t.string :cep
      t.string :telefone
      t.string :celular
      t.string :email
      t.text :historico

      t.timestamps
    end
    add_index :cartorios, :codigo, unique: true
    add_index :cartorios, :nome
    add_index :cartorios, :bairro
    add_index :cartorios, :rua
    add_index :cartorios, :cep
    add_index :cartorios, :historico
  end
end
