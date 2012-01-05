class CreatePases < ActiveRecord::Migration
  def change
    create_table :pases do |t|
      t.integer :oficina_id
      t.integer :catastro_id
      t.date :entrada
      t.text :observaciones

      t.timestamps
    end
  end
end
