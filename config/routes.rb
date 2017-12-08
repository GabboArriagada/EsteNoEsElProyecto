Rails.application.routes.draw do


mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
resources :posts
resources :asignaturas
resources :cursos
resources :contacts, only: [:new, :create]

resources :asignaturas do
  resources :notas
end
resources :questions do
resources :answers
end
get "preguntas", to:"questions#index"
resources :events

get 'calendario/index'
# seccion alumno
namespace :alumno do
  resources :notas
  match 'notas/show_nota' => 'notas#show_nota', via: :get
  resources :asignaturas
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

#seccion god
namespace :god do
  resources :user,:profesor,:alumno,:cursos
end


devise_for :users, controllers: { registrations: 'registrations' }
root 'welcome#index'
get 'welcome/index'
get "inicio", to:"welcome#index"



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
