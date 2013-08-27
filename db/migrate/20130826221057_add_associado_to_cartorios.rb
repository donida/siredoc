class AddAssociadoToCartorios < ActiveRecord::Migration
  def change
    add_column :cartorios, :associado, :boolean, :null => false, :default => false
  end
end
