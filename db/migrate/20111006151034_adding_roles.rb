class AddingRoles < ActiveRecord::Migration
  def up
    Role.create :name => "admin"
    Role.create :name => "manager"
    Role.create :name => "user"

    user = AdminUser.first
    user.role_ids =1
    user.save
  end

  def down
  end
end
