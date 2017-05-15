Rails.application.routes.draw do
  resources :pedidos
  resources :pagamentos
  resources :fazer_pedidos
  resources :produto_pedidos
  resources :produtos
  resources :formacao_eventos
  resources :eventos
  resources :conta
  resources :pessoas
  resources :tipo_eventos
  resources :equipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
