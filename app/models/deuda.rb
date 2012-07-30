class Deuda < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_deuda_path(self)
  end
  has_paper_trail

  belongs_to :tributable, :polymorphic => true

  belongs_to :periodo
  validates :tributable_id, :uniqueness => {:scope => [:tributable_type, :periodo_id]}

  default_scope :include => :periodo

  delegate :name, :to => :periodo, :prefix => true, :allow_nil => true
  delegate :vencimiento, :to => :periodo, :prefix => true, :allow_nil => true
  delegate :julian, :to => :periodo, :prefix => true, :allow_nil => true
  delegate :person_name, :to => :tributable, :prefix => true, :allow_nil => true
  delegate :address, :to => :tributable, :prefix => true, :allow_nil => true

  before_save :calcular_deuda

  def borrar
    if !baja
      self.baja = 1
      save
    end
  end

  def calcular_deuda
    self.monto = tributable.calcular_deuda(periodo)
  end

  def actualiazada
    tributable.calcular_deuda_actualizada(periodo)
  end

  def cb
    c = "0000582105#{ rellenar id, 6 }#{ periodo_name }0000010#{periodo_julian}#{convertir_monto}"
    "#{c}#{calcular_digito c}"
  end

  def convertir_monto
    rellenar((calcular_deuda * 100).to_i,6)
  end

  def rellenar(string, length)
    s = string.to_s
    if s.length < length
      s = rellenar("0#{string}", length)
    end
    s
  end

  def calcular_digito(codigo)
    dig = 0
    bb = 1
    codigo.length.times do |i|
      dig = dig + codigo[i].to_i * bb
      bb = bb + 1
      bb = 3 if bb > 9
    end
    (dig / 2)%10
  end

  def convetir_caracteres(codigo)
    resultado = ""
    resultado.concat(33)
    (0..(codigo.length - 1 )).step(2) do |i|
      caracter = codigo[i..i+1].to_i
      i = i + 1;
      if caracter < 92
        resultado.concat(caracter + 35)
      end
      resultado.concat(196) if caracter == 92
      resultado.concat(197) if caracter == 93
      resultado.concat(199) if caracter == 94
      resultado.concat(201) if caracter == 95
      resultado.concat(209) if caracter == 96
      resultado.concat(214) if caracter == 97
      resultado.concat(220) if caracter == 98
      resultado.concat(225) if caracter == 99
    end
    resultado.concat(34)
  end

  def obtener_codigo
    convetir_caracteres cb
  end
end
