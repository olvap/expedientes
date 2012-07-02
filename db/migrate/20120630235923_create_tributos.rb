class CreateTributos < ActiveRecord::Migration
  def change
    drop_table :tributos
    create_table :tributos do |t|
      t.string :name

      t.timestamps
    end
  end
end
