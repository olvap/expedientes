class CreatePersonasTdocs < ActiveRecord::Migration
  def change
    create_table :tdocs do |t|
      t.string :name

      t.timestamps
    end
  end
end
