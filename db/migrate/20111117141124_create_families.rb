class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :person_id
      t.integer :father_id
      t.integer :mother_id

      t.timestamps
    end
  end
end
