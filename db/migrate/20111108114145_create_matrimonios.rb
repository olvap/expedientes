class CreateMatrimonios < ActiveRecord::Migration
  def change
    create_table :matrimonios do |t|
      t.date :inicio
      t.string :estado
      t.integer :person1_id
      t.integer :person2_id

      t.timestamps
    end
  end
end
