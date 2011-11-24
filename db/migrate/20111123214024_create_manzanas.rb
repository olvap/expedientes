class CreateManzanas < ActiveRecord::Migration
  def change
    create_table :manzanas do |t|
      t.string :name
      t.boolean :luz
      t.boolean :agua
      t.boolean :gas
      t.boolean :cloaca

      t.timestamps
    end
  end
end
