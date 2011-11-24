class CreateFrentes < ActiveRecord::Migration
  def change
    create_table :frentes do |t|
      t.integer :categoria
      t.float :metros
      t.integer :avaluo_id

      t.timestamps
    end
  end
end
