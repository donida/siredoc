class CreateTipoRegistros < ActiveRecord::Migration
  def change
    create_table :tipo_registros do |t|
      t.string :nome
      t.string :chave

      t.timestamps
    end
    add_index :tipo_registros, :nome
    add_index :tipo_registros, :chave, unique: true
  end
end
