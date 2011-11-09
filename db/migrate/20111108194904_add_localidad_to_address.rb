class AddLocalidadToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :localidad_id, :integer
  end
end
