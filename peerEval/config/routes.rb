Rails.application.routes.draw do

  get 'student_sessions/new'
  root 'pages#home'
  get '/studentlogin', to: 'student_sessions#new'
  post   '/studentlogin',   to: 'student_sessions#create'
  delete '/studentlogout',  to: 'student_sessions#destroy'
  get '/studentsignup', to: 'students#update_password'
  patch 'studentsignup', to: 'students#update_password'
  get '/teachersignup', to: 'teachers#new'
  get    '/teacherlogin',   to: 'teacher_sessions#new'
  post   '/teacherlogin',   to: 'teacher_sessions#create'
  delete '/teacherlogout',  to: 'teacher_sessions#destroy'
  get '/addstudents',       to: 'teams_helper#index'
  post '/addstudents',       to: 'teams_helper#create'
  resources :students
  resources :teachers
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
