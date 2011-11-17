class AddLockToPeople < ActiveRecord::Migration
  def change
    add_column :people, :locked, :date
  end
end
