class AddPersonToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :person_id, :integer
  end
end
