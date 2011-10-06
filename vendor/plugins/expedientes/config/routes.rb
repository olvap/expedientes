Expedientes::Engine.routes.draw do

  resources :expedientes do
    resources :pases
  end

  resources :profesionals

  resources :oficinas do
    resources :pases
  end

end
