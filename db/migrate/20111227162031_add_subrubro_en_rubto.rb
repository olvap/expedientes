class AddSubrubroEnRubto < ActiveRecord::Migration
  def change
    add_column :rubros, :sub_rubro, :integer
  end
end
