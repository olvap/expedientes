ActiveAdmin.register Comercy do
  # El metodo has_one en active_admin no anda, no se si es un problema de active
  # admin o de inhered_resources, por ahora la mejor forma que encuentro es asi:
  #
  # coloco el belongs_to y el singleton en true.
  #   belongs_to :person, :singleton => true
  #
  # Despues sobreescribo el metodo new, para que cree la otra entidad y lo
  # redireccione al edit que anda bien.
  #
  # Tambien podria hacer un formulario new en lugar de crearlo directamente, pero
  # active admin me pone en blanco el layout cuando meto un render.

  belongs_to :person, :singleton => true

  controller do
    def new
      @person = Person.find(params[:person_id])
      if !@person.comercy
        @comercy = Comercy.new
        @comercy.person_id = @person.id
        @comercy.save
      else
        @comercy = @person.comercy
      end
      redirect_to edit_admin_person_comercy_path(@comercy.person,@comercy)
    end
  end

  form do |f|
    f.inputs "Detalles" do
      f.input :ingresos_brutos
      f.input :cuit
      f.input :cantidad_de_personal
      f.input :jubilado, :as => :boolean
    end
    f.buttons
  end
end
