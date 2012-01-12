class AddTributoColumnsInTgi < ActiveRecord::Migration
  def change
    add_column :tgis, :calle, :string
    add_column :tgis, :numero, :integer
    add_column :tgis, :otro, :string
    add_column :tgis, :pii, :string
    add_column :tgis, :address_id, :integer
  end
end
