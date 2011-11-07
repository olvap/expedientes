class CreatePersonasTaddresses < ActiveRecord::Migration
  def change
    create_table :taddresses do |t|
      t.string :name

      t.timestamps
    end
  end
end
