class AddIndexToPeople < ActiveRecord::Migration
  def change
    add_index(:people, :civil_id)
    add_index(:people, :tdoc_id)
    add_index(:people, :city_id)
    add_index(:people, :sexo_id)

    add_index(:addresses, :person_id)
    add_index(:addresses, :taddress_id)
    add_index(:addresses, :localidad_id)
  end
end
