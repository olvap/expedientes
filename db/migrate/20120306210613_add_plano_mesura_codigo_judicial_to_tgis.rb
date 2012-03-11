class AddPlanoMesuraCodigoJudicialToTgis < ActiveRecord::Migration
  def change
    #add_column :tgis, :plano_mesura, :string
    add_column :tgis, :codigo_judicial, :integer
  end
end
