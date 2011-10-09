class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.integer :person_id
      t.date :inicio
      t.string :legajo

      t.timestamps
    end
  end
end
