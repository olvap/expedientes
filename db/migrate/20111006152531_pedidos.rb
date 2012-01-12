class Pedidos < ActiveRecord::Migration
  def up
    create_table :pedidos,:id=>false do |t|
      t.integer :catastro_id
      t.integer :person_id

      t.timestamps
    end
  end

  def down
  end
end
