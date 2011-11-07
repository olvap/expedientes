class Address < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  def admin_permalink
    admin_person_address_path(self.person,self)
  end

  # FIX: cuando se solucione el problema de rails.

  belongs_to :taddress
  belongs_to :person
  #belongs_to :city

  def format
    "#{street} #{number} #{other}"
  end
end
