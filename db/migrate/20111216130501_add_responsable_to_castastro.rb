class AddResponsableToCastastro < ActiveRecord::Migration
  def change
    add_column :catastros, :responsable, :string
  end
end
