class CreatePersonasPeople < ActiveRecord::Migration
  def change
    create_table :personas_people do |t|
      t.string :name
      t.date :born
      t.string :doc
      t.date :dead
      t.text :observations
      t.integer :civil_id
      t.integer :tdoc_id
      t.integer :city_id
      t.integer :sexo_id

      t.timestamps
    end
  end
end
