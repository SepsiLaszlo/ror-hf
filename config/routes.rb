Rails.application.routes.draw do
  resources :courses
  resources :course_types
  resources :subjects do
    post :apply, on: :member
  end
  resources :users

  root 'subjects#index'
end
