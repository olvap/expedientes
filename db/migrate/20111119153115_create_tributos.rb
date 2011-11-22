class CreateTributos < ActiveRecord::Migration
  def change
    create_table :tributos do |t|
      t.string :calle
      t.integer :numero
      t.string :otro
      t.string :pii
      t.integer :address_id

      t.timestamps
    end
  end
end
