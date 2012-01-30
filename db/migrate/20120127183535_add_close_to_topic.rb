class AddCloseToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :close, :boolean
    add_column :topics, :admin_user_id, :integer

  end
end
