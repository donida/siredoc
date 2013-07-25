class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome, :null => false
      t.string :sigla

      t.timestamps
    end
    add_index :estados, :nome, unique: true
    add_index :estados, :sigla, unique: true
  end
end
