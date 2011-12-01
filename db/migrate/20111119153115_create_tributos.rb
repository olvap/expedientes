class CreateTributos < ActiveRecord::Migration
  def change
    create_table :tributos do |t|
      t.string :calle
      t.integer :numero
      t.string :otro
      t.string :pii
      t.integer :address_id
      t.integer :tributable_id
      t.string :tributable_type

      t.timestamps
    end
  end
end
