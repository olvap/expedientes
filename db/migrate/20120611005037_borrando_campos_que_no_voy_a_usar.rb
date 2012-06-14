class BorrandoCamposQueNoVoyAUsar < ActiveRecord::Migration
  def up
    remove_column :pases, :catastro_id
    drop_table :pedidos
  end

  def down
  end
end
