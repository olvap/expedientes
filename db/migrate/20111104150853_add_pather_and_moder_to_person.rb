class AddPatherAndModerToPerson < ActiveRecord::Migration
  def change
    add_column :people, :pather_id, :integer
    add_column :people, :mother_id, :integer
  end
end
