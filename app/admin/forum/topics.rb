ActiveAdmin.register Topic do

  menu false

  belongs_to :forum, :optional => true

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      @topic = Topic.find_by_name(params[:name])
      show!
    end
  end

  show :title => :name do
    div do
      raw topic.body
    end
    active_admin_comments
  end

  form do |f|

    f.inputs "Detalles" do
      f.input :forum
      f.input :name
      f.input :body
    end

    f.buttons
  end

end
