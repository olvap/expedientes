class ConveniosDeudas < ActiveRecord::Migration
  def up
    create_table :convenios_deudas, :id => false do |t|
      t.integer :convenio_id
      t.integer :deuda_id

      t.timestamps
    end
  end

  def down
  end
end
