ActiveAdmin.register Mensaje do
  menu false

  form do |f|
    f.inputs "Detalle" do
      f.input :admin_user_id,
      :input_html => {
        "data-pre" => f.object.admin_user_token.to_json(:methods => :email), :only => [:id, :email] }
      f.input :body
    end
    f.buttons
  end

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index

    def create
      @mensaje = Mensaje.new(params[:mensaje])
      @mensaje.from = current_admin_user
      create! do |format|
        format.html {redirect_to inbox_admin_admin_user_path current_admin_user}
      end
    end
  end

  show do
    panel "Mensaje" do
      div p mensaje.from
      div p mensaje.body
    end
  end
end
