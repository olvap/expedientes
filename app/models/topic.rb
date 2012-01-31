class Topic < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  belongs_to :forum
  belongs_to :admin_user
  has_many :active_admin_comments, :class_name => "ActiveAdmin::Comment", :as => :resource, :dependent  => :destroy


  scope :abierto, where(:close => nil )
  scope :cerrado, where(:close => true )

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
end
