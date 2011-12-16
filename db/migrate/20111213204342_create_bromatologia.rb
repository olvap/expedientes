class CreateBromatologia < ActiveRecord::Migration
  def change
    create_table :bromatologias do |t|
      t.integer :address_id
      t.integer :person_id
      t.timestamps
    end
  end
end
