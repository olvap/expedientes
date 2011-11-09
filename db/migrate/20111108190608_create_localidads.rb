class CreateLocalidads < ActiveRecord::Migration
  def change
    create_table :localidads do |t|
      t.string :name
      t.integer :departamento_id
      t.string :postal

      t.timestamps
    end
  end
end
