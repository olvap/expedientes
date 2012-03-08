class Oficina < ActiveRecord::Base

  has_paper_trail
  has_many :pases
  has_many :catastros, :through => :pases

  has_and_belongs_to_many :admin_users, :class_name => "AdminUser",
                          :join_table => :admin_users_oficinas, :uniq => true

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_oficina_path(self)
  end

end
