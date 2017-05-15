Rails.application.routes.draw do
  resources :pagamentos
  resources :fazer_pedidos
  resources :accounts
  resources :pedidos
  resources :produto_pedidos
  resources :produtos
  resources :formacao_eventos
  resources :eventos
  resources :pessoas
  resources :tipo_eventos
  resources :equipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
