class AddMontoToDeuda < ActiveRecord::Migration
  def change
    add_column :deudas, :monto, :float
  end
end
