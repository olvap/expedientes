ActiveAdmin.register Avaluo do
  belongs_to :tgi

  show do
    attributes_table_for avaluo,
      :valor, :descuento, :estado, :edificacion, :categoria, :metros
    panel "frentes" do
      table_for tgi.avaluos.last.frentes do
        column :categoria
        column :metros
      end
    end

  end

  form do |f|
    f.inputs "Details" do
      f.input :valor
      f.input :descuento
      f.input :estado
      f.input :edificacion
      f.has_many :frentes do |n|
        n.inputs :categoria, :metros
      end

    end
    f.buttons
  end

  controller do

    def new
      @tgi = Tgi.find(params[:tgi_id])
      ultimo = @tgi.avaluos.last
      if ultimo
        @avaluo = ultimo.dup
        @avaluo.frentes << ultimo.frentes.collect do |frente|
          frente.dup
        end
      else
        @avaluo = Avaluo.new()
      end
    end

#    def create
#      create! do |format|
#        format.html {redirect_to admin_tgi_path @tgi}
#      end
#    end

  end

end
