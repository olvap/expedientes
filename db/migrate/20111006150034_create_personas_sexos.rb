class CreatePersonasSexos < ActiveRecord::Migration
  def change
    create_table :personas_sexos do |t|
      t.string :name

      t.timestamps
    end
  end
end
