class CreateAvaluos < ActiveRecord::Migration
  def change
    create_table :avaluos do |t|
      t.integer :tgi_id
      t.float :valor
      t.float :descuento
      t.integer :edificacion_id
      t.integer :estado_id

      t.timestamps
    end
  end
end
