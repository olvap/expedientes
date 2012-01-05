class AddLockToPeople < ActiveRecord::Migration
  def change
    add_column :people, :locked_at, :datetime
  end
end
