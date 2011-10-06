Rails.application.routes.draw do
  mount Personas::Engine => "/personas", :as => "personas"
  mount Expedientes::Engine => "/expedientes"
end
