class CreatePersonasCivils < ActiveRecord::Migration
  def change
    create_table :personas_civils do |t|
      t.string :name

      t.timestamps
    end
  end
end
