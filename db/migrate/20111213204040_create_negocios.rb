class CreateNegocios < ActiveRecord::Migration
  def change
    create_table :negocios do |t|
      t.string :name
      t.integer :categoria
      t.belongs_to :rubro
      t.belongs_to :bromatologia

      t.timestamps
    end
    add_index :negocios, :rubro_id
    add_index :negocios, :bromatologia_id
  end
end
