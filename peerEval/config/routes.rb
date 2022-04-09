Rails.application.routes.draw do
  resources :evaluations
  resources :students
  get 'evaluations/new'
  get 'students/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
