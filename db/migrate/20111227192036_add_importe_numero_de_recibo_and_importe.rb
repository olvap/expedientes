class AddImporteNumeroDeReciboAndImporte < ActiveRecord::Migration
  def change
    add_column :catastros, :numero_de_recibo, :integer
    add_column :catastros, :importe, :float
  end
end
