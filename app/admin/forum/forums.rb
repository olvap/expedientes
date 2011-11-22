ActiveAdmin.register Forum do

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  index :as => :block do |forum|
    div :for => forum do
      h2 link_to(forum.name,admin_forum_path(forum))
      div do
        simple_format forum.descripcion
      end
    end
  end
  
  show do
    panel :topicos do
      table_for forum.topics do
        column :name do |v| link_to v.name, admin_forum_topic_path(v.forum,v) end
      end
    end
  end
  action_item(:only => :show) do
    link_to("Nuevo Topico", new_admin_forum_topic_path(forum))
  end
end
