Rails.application.routes.draw do
  resources :courses
  resources :course_types
  resources :subjects do
    post :apply, on: :member
    post :drop, on: :member
  end
  resources :users do
    post :login, on: :collection
    post :logout, on: :collection
  end

  root 'subjects#index'
end
