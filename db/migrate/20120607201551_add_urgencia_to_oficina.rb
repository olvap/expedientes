class AddUrgenciaToOficina < ActiveRecord::Migration
  def change
    add_column :oficinas, :urgencia, :integer, :default => 0
  end
end
