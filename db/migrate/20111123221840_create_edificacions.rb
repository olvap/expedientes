class CreateEdificacions < ActiveRecord::Migration
  def change
    create_table :edificacions do |t|
      t.string :name

      t.timestamps
    end
  end
end
