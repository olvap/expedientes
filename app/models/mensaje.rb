class Mensaje < ActiveRecord::Base

  belongs_to :from, :class_name => 'AdminUser'

  belongs_to :admin_user
#  belongs_to :to, :class_name => 'AdminUser'

  default_scope :order => 'created_at desc'

  def admin_user_token
    [admin_user]
  end
end
