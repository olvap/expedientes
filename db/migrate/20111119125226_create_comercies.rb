class CreateComercies < ActiveRecord::Migration
  def change
    create_table :comercies do |t|
      t.integer :person_id
      t.float :ingresos_brutos
      t.integer :cantidad_de_personal
      t.string :cuit
      t.boolean :jubilado
      t.boolean :muerto

      t.timestamps
    end
  end
end
