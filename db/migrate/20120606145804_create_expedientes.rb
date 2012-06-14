class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.integer :mesa_de_entrada
      t.integer :numero_expediente_colegio
      t.date :final_de_obra
      t.string :partida
      t.integer :category_id
      t.string :type
      t.integer :convenio_id
      t.integer :pase_id
      t.integer :numero_de_recibo
      t.float :importe
      t.string :responsable

      t.timestamps
    end
  end
end
