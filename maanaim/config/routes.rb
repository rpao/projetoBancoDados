Rails.application.routes.draw do
  get 'paginas/inicio'

  get 'paginas/ajuda'
  
  get 'paginas/lista_eventos'
  
  root 'paginas#inicio'
  
  scope '/admin' do
    resources :users
  end
  
  scope "/:evento" do
    resources :pagamentos
    resources :pedidos
  end
  
  get '/eventos/:id/relatorio', to: 'eventos#relatorio', as: 'relatorio_evento'
  
  
  resources :produto_pedidos
  resources :produtos
  resources :eventos
  resources :pessoas
  resources :tipo_eventos
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
