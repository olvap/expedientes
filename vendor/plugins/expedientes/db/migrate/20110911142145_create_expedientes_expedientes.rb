class CreateExpedientesExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes_expedientes do |t|
      t.integer :numero_expediente_colegio
      t.date :final_de_obra
      t.integer :profesional_id
      t.string :partida
      t.integer :convenio_id
      t.integer :pase_id

      t.timestamps
    end
  end
end
