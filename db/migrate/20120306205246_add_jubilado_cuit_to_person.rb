class AddJubiladoCuitToPerson < ActiveRecord::Migration
  def change
    add_column :person, :jubilado, :boolean
    add_column :person, :cuit, :string

  end
end
