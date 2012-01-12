class CreateCatastros < ActiveRecord::Migration
  def change
    create_table :catastros do |t|
      t.integer :numero_expediente_colegio
      t.date :final_de_obra
      t.string :partida
      t.integer :category_id
      t.string :type
      t.integer :convenio_id
      t.integer :pase_id

      t.timestamps
    end
  end
end
