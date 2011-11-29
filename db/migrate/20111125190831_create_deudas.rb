class CreateDeudas < ActiveRecord::Migration
  def change
    create_table :deudas do |t|
      t.integer :tributable_id
      t.string :tributable_type
      t.integer :periodo_id
      t.integer :calculable_id
      t.string :calculable_type
      t.boolean :baja
      t.text :motivo

      t.timestamps
    end
  end
end
