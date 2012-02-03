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
