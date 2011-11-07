class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.integer :person_id
      t.string :name
      t.date :inicio
      t.string :duracion
      t.string :institucion
      t.string :titulo

      t.timestamps
    end
  end
end
