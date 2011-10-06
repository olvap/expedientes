Personas::Engine.routes.draw do

  resources :people do
    resources :addresses
  end

  resources :taddresses

  resources :sexos

  resources :tdocs

  resources :civils

end
