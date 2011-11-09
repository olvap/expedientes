class Matrimonio < ActiveRecord::Base

  belongs_to :person1,:class_name => "Person", :foreign_key => "person1_id"
  belongs_to :person2,:class_name => "Person", :foreign_key => "person2_id"

  def name
    person1
  end

end
