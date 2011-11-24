class CreateTgivariables < ActiveRecord::Migration
  def change
    create_table :tgivariables do |t|
      t.integer :tgi_id
      t.float :avaluo
      t.integer :edificacion_id
      t.float :descuento
      t.integer :estado_id

      t.timestamps
    end
  end
end
