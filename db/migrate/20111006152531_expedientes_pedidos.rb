class ExpedientesPedidos < ActiveRecord::Migration
  def up
    create_table :expedientes_pedidos,:id=>false do |t|
      t.integer :expediente_id
      t.integer :person_id

      t.timestamps
    end
  end

  def down
  end
end
