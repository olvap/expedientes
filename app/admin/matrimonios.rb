ActiveAdmin.register Matrimonio do
  belongs_to :person

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index  
  end
end
