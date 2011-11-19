class Profesional < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  has_paper_trail

  def admin_permalink
    admin_person_profesional_path(self.person,self)
  end

  belongs_to :person

  def persons
    [self.person]
  end

  def name
    person.try :name
  end

end
