ActiveAdmin.register Profesional do
  belongs_to :person

  form :url => {:controller => "admin/profesionals"} do |f|
    f.inputs "Details" do
      f.input :titulo
      f.input :matricula
    end

    f.buttons
  end
end
