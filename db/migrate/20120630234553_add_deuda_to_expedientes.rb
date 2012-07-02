class AddDeudaToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :deuda, :float
    add_column :expedientes, :periodos, :integer
    add_column :expedientes, :tributo_id, :integer
    add_column :expedientes, :cuenta, :integer
  end
end
