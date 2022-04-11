Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  get 'projects/new'
  get 'teams/new'
  get 'teachers/new'
  get 'evaluations/new'
  get 'students/new'
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
