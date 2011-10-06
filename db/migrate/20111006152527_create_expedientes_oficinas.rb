class CreateExpedientesOficinas < ActiveRecord::Migration
  def change
    create_table :expedientes_oficinas do |t|
      t.string :name

      t.timestamps
    end
  end
end
