class CreatePersonasTaddresses < ActiveRecord::Migration
  def change
    create_table :personas_taddresses do |t|
      t.string :name

      t.timestamps
    end
  end
end
