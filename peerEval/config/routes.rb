Rails.application.routes.draw do

  root 'pages#home'
  get '/teachersignup', to: 'teachers#new'
  get    '/teacherlogin',   to: 'teacher_sessions#new'
  post   '/teacherlogin',   to: 'teacher_sessions#create'
  delete '/teacherlogout',  to: 'teacher_sessions#destroy'
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
