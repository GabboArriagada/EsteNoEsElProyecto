Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  resources :asignaturas
  resources :cursos
  get "archivos/subir_archivos"
  post "archivos/subir_archivos"
  get "archivos/listar_archivos"
  post "archivos/borrar_archivos"
  get "archivos/guardar_comentarios"
  post "archivos/guardar_comentarios"

  get 'foro/index'
  resources :asignaturas do
    resources :notas
  end
  resources :questions do
  resources :answers
  end
  resources :events

  get 'redes_sociales/facebook'

  get 'redes_sociales/twitter'

  get 'redes_sociales/google_mas'

  # seccion alumno
  namespace :alumno do
    resources :notas
    match 'notas/show_nota' => 'notas#show_nota', via: :get
    resources :asignaturas
  end

  #seccion profesor
  namespace :profesor do
    resources :notas
    resources :cursos
  end

  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get "inicio", to:"welcome#index"
  get 'cont/contact'
  get "contacto", to:"cont#contact"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
