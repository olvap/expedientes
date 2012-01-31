ActiveAdmin.register ActiveAdmin::Comment do
  menu false

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end
end
