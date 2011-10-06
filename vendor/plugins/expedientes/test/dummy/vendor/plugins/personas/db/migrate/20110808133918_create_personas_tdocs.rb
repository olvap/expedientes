class CreatePersonasTdocs < ActiveRecord::Migration
  def change
    create_table :personas_tdocs do |t|
      t.string :name

      t.timestamps
    end
  end
end
