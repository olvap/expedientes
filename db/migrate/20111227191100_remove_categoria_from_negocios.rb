class RemoveCategoriaFromNegocios < ActiveRecord::Migration
  def change
    remove_column :negocios, :categoria
  end
end
