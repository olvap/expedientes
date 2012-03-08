class AdminUsersOficinas < ActiveRecord::Migration
  def change
    create_table :admin_users_oficinas, :id => false do |t|
      t.integer :admin_user_id
      t.integer :oficina_id
    end
  end
end
