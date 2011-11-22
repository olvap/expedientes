class Responsables < ActiveRecord::Migration
  def up
    create_table :responsables,:id=>false do |t|
      t.integer :tributo_id
      t.integer :person_id

      t.timestamps
    end
  end

  def down
  end
end
