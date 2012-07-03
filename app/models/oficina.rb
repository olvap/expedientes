class Oficina < ActiveRecord::Base

  has_paper_trail
  has_many :pases
  has_many :expedientes, :through => :pases

  has_and_belongs_to_many :admin_users, :class_name => "AdminUser",
                          :join_table => :admin_users_oficinas, :uniq => true

  has_and_belongs_to_many :destinos,
                                           :class_name => "Oficina",
                                           :association_foreign_key =>
"destino_id",
                                           :join_table => "destinos_oficinas"

  scope :iniciales, where(:inicial => true)
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_oficina_path(self)
  end

  def to_s
    name
  end
end
