class Tributo < ActiveRecord::Base
  belongs_to :address
  has_and_belongs_to_many :titulares, :class_name => "Person",
                        :join_table => :titulares, :uniq => true

  has_and_belongs_to_many :responsables, :class_name => "Person",
                        :join_table => :responsables, :uniq => true

  attr_reader :responsables_tokens
  attr_reader :titulares_tokens

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

end
