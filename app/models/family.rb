class Family < ActiveRecord::Base
  belongs_to :person
  
  belongs_to :father,:class_name => "Person", :foreign_key => "father_id"
  belongs_to :mother,:class_name => "Person", :foreign_key => "mother_id"

  scope :hijosv, lambda {|father| where(:father_id =>father)}
  scope :hijosm, lambda {|father| where(:mother_id =>mother)}
  scope :hijos_de, lambda{|father| where("father_id = ? or mother_id =?",father,father)}
  scope :hermanos, lambda{|person| where("( father_id = ? or mother_id = ? ) and person_id != ?",person.family.try(:father),person.family.try(:mother),person.id)}

  def fathers
    if father
      [father]
    else
      []
    end
  end

  def mothers
    if mother
      [mother]
    else
      []
    end
  end
  
  def parents
    fathers + mothers
  end

end
