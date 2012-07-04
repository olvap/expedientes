class Periodo < ActiveRecord::Base

  #calcula el interes al dia acutual
  def interes
    1.1
  end

  def year
    name[0..3].to_i
  end

  def month
    name[4..6].to_i
  end
end
