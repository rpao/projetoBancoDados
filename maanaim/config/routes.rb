Rails.application.routes.draw do
  resources :eventos
  resources :tipo_eventos
  resources :equipes
  resources :pessoas
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
