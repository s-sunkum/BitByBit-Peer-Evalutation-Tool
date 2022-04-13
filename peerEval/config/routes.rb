Rails.application.routes.draw do
  get 'teacher_sessions/new'
  get 'pages/home'
  root 'pages#home'
  get 'projects/new'
  resources :students
  resources :teachers
  get '/teachersignup', to: 'teachers#new'
  get    '/teacherlogin',   to: 'teacher_sessions#new'
  post   '/teacherlogin',   to: 'teacher_sessions#create'
  delete '/teacherlogout',  to: 'teacher_sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
