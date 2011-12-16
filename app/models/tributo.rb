class Tributo < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_tributo_path(self)
  end
  has_paper_trail

  belongs_to :address
  belongs_to :tributable, :polymorphic => true

  #accepts_nested_attributes_for :tgi
    
  has_and_belongs_to_many :titulares, :class_name => "Person",
                        :join_table => :titulares, :uniq => true

  has_and_belongs_to_many :responsables, :class_name => "Person",
                        :join_table => :responsables, :uniq => true

  attr_reader :responsables_tokens
  attr_reader :titulares_tokens

  scope :tgi, joins(:tgi) #& where(:id=>1

  def responsables_tokens=(ids)
    self.responsable_ids = ids.split(",")
  end

  def titulares_tokens=(ids)
    self.titulare_ids = ids.split(",")
  end

  def addresses
    a = []
    responsables.map{|k,v|k.addresses.each{|address| a += [address]}} +
    titulares.map{|k,v|k.addresses.each{|address| a += [address]}}
    a
  end

  def ubicacion
    "#{calle} #{numero} #{otro}"
  end
end
