class AddFieldsToBromatologia < ActiveRecord::Migration
  def change
    add_column :bromatologias, :libreta_sanitaria, :boolean
    add_column :bromatologias, :curso_de_manipulador, :boolean
    add_column :bromatologias, :control_de_plagas, :boolean
  end
end
