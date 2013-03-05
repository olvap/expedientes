class AddDeudaCatastro < ActiveRecord::Migration
  def change
    add_column :catastros, :periodos, :integer 
    add_column :catastros, :monto, :float
    add_column :catastros, :tributo_id, :integer
  end

end
