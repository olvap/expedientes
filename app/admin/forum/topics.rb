ActiveAdmin.register Topic do

  menu false

  belongs_to :forum, :optional => true

  filter :name
  filter :body

  scope :abierto, :default => true
  scope :cerrado

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      @topic = Topic.find(params[:id])

      #esto deberia ser un after create comments, pero no quiero sobre escribir
      #la gema de aa
      @topic.marcar_leido(current_admin_user)
      if @topic.active_admin_comments.last.try(:created_at).to_i + 15 >= Time.now.to_i
        @topic.avisar_participantes
        @topic.marcar_leido(current_admin_user)
      end
      @topic.save!
      show!
    end

    def create
      @topic = Topic.new(params[:topic])
      @topic.admin_user = current_admin_user
      create!
    end
  end

  index do
    column :name
    column :iniciado_por
    column :respuestas
    column :ultimo_post
    default_actions
  end

  show :title => :name do
    active_admin_comments
  end

  form do |f|

    f.inputs "Detalles" do
      f.input :forum_id, :as => :hidden
      f.input :name
    end

    f.buttons
  end

  member_action :close do
    @topic = Topic.find(params[:id])
    @topic.close = true
    @topic.save!
    redirect_to :action => :show
  end

  member_action :open do
    @topic = Topic.find(params[:id])
    @topic.close = false
    @topic.save!
    redirect_to :action => :show
  end

  action_item(:except =>[:index,:new]) do
    if topic.close?
      link_to("Abrir", open_admin_topic_path(topic))
    else
      link_to("Cerrar", close_admin_topic_path(topic))
    end
  end

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("topics")}}

end
