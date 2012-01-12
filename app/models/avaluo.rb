class Avaluo < ActiveRecord::Base

  belongs_to :tgi
  belongs_to :edificacion
  belongs_to :estado

  has_many :frentes
  accepts_nested_attributes_for :frentes

  has_many :deudas, :as => :calculable

  validate :sin_deuda

  def sin_deuda
    errors.add(:valor, "Este valor esta siendo usado por un registro de deuda, por lo tanto no puede modificarse") if deudas.count > 0
  end

  def categoria
    c = 0
    max = 0
    frentes.each do |frente|
      if(frente.metros and frente.metros > max)
        max = frente.metros
        c = frente.categoria
      end
    end
    c
  end

  def metros
    frentes.sum(:metros) / frentes.count
  end

end
