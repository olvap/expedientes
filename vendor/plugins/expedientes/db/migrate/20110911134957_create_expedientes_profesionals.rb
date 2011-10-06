class CreateExpedientesProfesionals < ActiveRecord::Migration
  def change
    create_table :expedientes_profesionals do |t|
      t.string :titulo
      t.integer :matricula
      t.integer :person_id

      t.timestamps
    end
  end
end
