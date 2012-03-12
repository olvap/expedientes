class ActiveAdminsTopics < ActiveRecord::Migration
  def change
    create_table :admin_users_topics, :id => false do |t|
      t.integer :admin_user_id
      t.integer :topic_id
    end

    add_index(:admin_users_topics, :admin_user_id)
    add_index(:admin_users_topics, :topic_id)
  end
end
