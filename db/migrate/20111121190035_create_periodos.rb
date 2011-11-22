class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.date :vencimiento

      t.timestamps
    end
  end
end
