Rails.application.routes.draw do
  resources :medicos
  resources :pacientes
  resources :receitas
  resources :secretarias
  resources :medicamentos
  resources :substancias
  resources :empresas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
