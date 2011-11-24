class Avaluo < ActiveRecord::Base

  belongs_to :tgi
  belongs_to :edificacion
  belongs_to :estado

  has_many :frentes

  def categoria
    c = 0
    frentes.each do |f|
      if f.categoria > c
        c = f.categoria
      end
    end
    c
  end
  
  def metros
    frentes.sum(:metros) / frentes.count
  end
  
end
