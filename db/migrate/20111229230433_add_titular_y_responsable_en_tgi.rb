class AddTitularYResponsableEnTgi < ActiveRecord::Migration
  def change
    add_column :tgis, :responsable_id, :integer
    add_column :tgis, :titular_id, :integer
  end
end
