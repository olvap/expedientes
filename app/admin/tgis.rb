ActiveAdmin.register Tgi do
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

  belongs_to :tributo, :singleton => true

  controller do
    def new
      @tributo = Tributo.find(params[:tributo_id])
      if !@tributo.tgi
        @tgi = Tgi.new
        @tgi.tributo_id = @tributo.id
        @tgi.save
      else
        @tgi = @tributo.tgi
      end
      redirect_to edit_admin_tributo_tgi_path(@tgi.tributo,@tgi)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :seccion_inmueble
      f.input :manzana
      f.input :superficie
      f.input :seccion
      f.input :lote
      f.input :folio
      f.input :tomo
      f.input :inscripcion_dominio
      f.input :fecha
      f.input :parcela
    end
    f.buttons
  end
end
