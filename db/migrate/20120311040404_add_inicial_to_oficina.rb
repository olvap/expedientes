class AddInicialToOficina < ActiveRecord::Migration
  def change
    add_column :oficinas, :inicial, :boolean
  end
end
