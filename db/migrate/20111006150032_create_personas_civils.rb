class CreatePersonasCivils < ActiveRecord::Migration
  def change
    create_table :civils do |t|
      t.string :name

      t.timestamps
    end
  end
end
