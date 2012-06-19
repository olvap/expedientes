class AddUrgenciaToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :urgencia, :integer, :default => 0
  end
end
