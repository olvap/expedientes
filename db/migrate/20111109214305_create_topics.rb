class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :forum_id
      t.text :body

      t.timestamps
    end
  end
end
