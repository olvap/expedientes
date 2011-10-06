class CreateExpedientesPases < ActiveRecord::Migration
  def change
    create_table :expedientes_pases do |t|
      t.integer :oficina_id
      t.integer :expediente_id
      t.date :entrada
      t.text :observaciones

      t.timestamps
    end
  end
end
