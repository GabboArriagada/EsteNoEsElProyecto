Rails.application.routes.draw do


mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
resources :posts
resources :asignaturas
resources :cursos
match 'curso/horario' => 'curso#horario', via: :get
match 'curso/foro' => 'curso#foro', via: :get
resources :contacts, only: [:new, :create]

resources :asignaturas do
  resources :notas
end
resources :temas

resources :questions do
resources :answers
end

get "preguntas", to:"questions#index"
get "foros", to:"questions#temas"

resources :events

get 'calendario/index'
# seccion alumno
namespace :alumno do
  resources :notas
  match 'notas/show_nota' => 'notas#show_nota', via: :get
  resources :asignaturas
  resources :asistencias
end

#seccion profesor
namespace :profesor do
  resources :presences do
    member do
      get :asists
    end
    collection do
     post 'create_multiple'
    end
  end
  resources :notas
  resources :cursos

  resources :asignaturas do
    member do
      get :notas
    end
  end
  resources :posts
end
namespace :configuraciones do
  resources :usuarios
end
#seccion god
namespace :god do
  resources :user,:profesor,:alumno,:cursos,:asignaturas
  match 'asignaturas/notas/' => 'asignaturas#notas', via: :post
  match 'asignaturas/asignar/' => 'asignaturas#asignar', via: :post
  match 'asignaturas/desasignar/' => 'asignaturas#desasignar', via: :post
  match 'asignaturas/asignarcurso/' => 'asignaturas#asignarcurso', via: :post
  match 'asignaturas/desasignarcurso/' => 'asignaturas#desasignarcurso', via: :post
  match 'cursos/asignar/' => 'cursos#asignar', via: :post
  match 'cursos/desasignar/' => 'cursos#desasignar', via: :post
  match 'user/toprofesor/' => 'user#toprofesor',via: :post
  match 'user/toalumno/' => 'user#toalumno',via: :post
  match 'user/toadmin/' => 'user#toadmin',via: :post
  match 'user/removeprofesor/' => 'user#removeprofesor',via: :post
  match 'user/removealumno/' => 'user#removealumno',via: :post
  match 'user/removeadmin/' => 'user#removeadmin',via: :post
end


devise_for :users, controllers: { registrations: 'registrations' }
root 'welcome#index'
get 'welcome/index'
get "inicio", to:"welcome#index"



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
