class AddSeguimientoToOficina < ActiveRecord::Migration
  def change
    add_column :oficinas, :seguimiento, :boolean
  end
end
