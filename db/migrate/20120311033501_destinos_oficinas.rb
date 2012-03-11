class DestinosOficinas < ActiveRecord::Migration
  def change
    create_table :destinos_oficinas, :id => false do |t|
      t.integer :destino_id
      t.integer :oficina_id
    end
  end
end
