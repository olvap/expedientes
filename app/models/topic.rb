class Topic < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :forum
end
