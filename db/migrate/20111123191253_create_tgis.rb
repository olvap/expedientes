class CreateTgis < ActiveRecord::Migration
  def change
    create_table :tgis do |t|
      t.integer :tributo_id
      t.integer :manzana_id
      t.string :seccion_inmueble
      t.float :superficie
      t.string :seccion
      t.string :lote
      t.string :folio
      t.string :tomo
      t.string :inscripcion_dominio
      t.date :fecha
      t.string :parcela

      t.timestamps
    end
  end
end
