class AddJubiladoCuitToPerson < ActiveRecord::Migration
  def change
    add_column :people, :jubilado, :boolean
    add_column :people, :cuit, :string

  end
end
