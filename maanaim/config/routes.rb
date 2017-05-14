Rails.application.routes.draw do
  resources :pessoas
  resources :eventos
  resources :tipo_eventos
  resources :equipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
