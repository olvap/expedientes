class CreateProfesionals < ActiveRecord::Migration
  def change
    create_table :profesionals do |t|
      t.string :titulo
      t.integer :matricula
      t.integer :person_id

      t.timestamps
    end
  end
end
