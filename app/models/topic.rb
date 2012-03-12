class Topic < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  belongs_to :forum
  belongs_to :admin_user
  has_many :active_admin_comments, :class_name => "ActiveAdmin::Comment", :as => :resource, :dependent  => :destroy

  has_and_belongs_to_many :admin_users, :class_name => "AdminUser",
                          :join_table => :admin_users_topics, :uniq => true

  scope :abierto, where(:close => false )
  scope :cerrado, where(:close => true )

  #son los ids de los usuarios que comentaron el tema.
  def participantes
    active_admin_comments(:select => :author_id).collect(&:author_id).uniq
  end

  def marcar_leido(user)
    self.admin_users.delete(user)
  end

  def avisar_participantes
    self.admin_user_ids = active_admin_comments(:select => :author_id).collect(&:author_id).uniq
  end

  def iniciado_por
    active_admin_comments.first.try(:author)
  end

  def respuestas
    active_admin_comments.count - 1
  end

  def ultimo_post
    active_admin_comments.last.try(:created_at)
  end

  def close?
    (close==true)
  end

  def help(action)
    body = active_admin_comments.first.try(:body)
    if body
      short = body.split("#{action}</h3>")
      first = short[0].split("<br>")[0]
      page = short[1].split("<h3>")[0] if short[1]
      "#{first} <br> #{page}"
    end
  end
end
