class CreatePersonasSexos < ActiveRecord::Migration
  def change
    create_table :sexos do |t|
      t.string :name

      t.timestamps
    end
  end
end
