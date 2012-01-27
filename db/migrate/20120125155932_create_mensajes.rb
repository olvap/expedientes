class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.integer :from_id
      t.integer :admin_user_id
      t.text :body

      t.timestamps
    end
  end
end
