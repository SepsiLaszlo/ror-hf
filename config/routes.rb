Rails.application.routes.draw do
  resources :courses
  resources :course_types
  resources :subjects do
    post :apply, on: :member
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
