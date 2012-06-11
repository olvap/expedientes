class AddExpedienteToPase < ActiveRecord::Migration
  def change
    add_column :pases, :expediente_id, :integer
  end
end
