class CreatePersonasAddresses < ActiveRecord::Migration
  def change
    create_table :personas_addresses do |t|
      t.string :street
      t.integer :number
      t.string :other
      t.string :email
      t.string :telefono
      t.integer :taddress_id
      t.integer :person_id

      t.timestamps
    end
  end
end
