ActiveAdmin.register Address do

  belongs_to :person

  form do |f|
    f.inputs "Details" do
      f.input :taddress
      f.input :street
      f.input :number
      f.input :other
      f.input :email
      f.input :telefono
      f.input :person_id, :as => :hidden

    end

    f.buttons
  end

  controller do
    def create

      create! do |format|
        format.html {redirect_to admin_person_path @person}
      end
    end

    def update

      update! do |format|
        format.html {redirect_to admin_person_path @person}
      end
    end

  end

end
