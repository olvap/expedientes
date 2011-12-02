class CreateConvenios < ActiveRecord::Migration
  def change
    create_table :convenios do |t|
      t.integer :tributable_id
      t.string :tributable_type
      t.integer :tributo_id
      t.date :inicio
      t.integer :cuotas
      t.float :interes

      t.timestamps
    end
  end
end
