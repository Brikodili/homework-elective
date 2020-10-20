Rails.application.routes.draw do
  scope '/u' do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }
  end

  resources :users

  get 'users/:id/courses', to: 'users#user_courses', as: 'user_courses'

  resources :courses
  get 'courses/:course_id/students/', to: 'courses#students', as: 'course_students'
  # get 'courses/:user_id', to: 'courses#user_courses', as: 'user_courses'

  post '/course_attendance/:course_id', to: 'course_attendance#create', as: 'course_attendance'

  resources :user_scores
  get 'courses/:course_id/user_scores', to: 'user_scores#course_user_scores', as: 'course_user_scores'
  get 'user_score/:course_id', to: 'user_scores#new', as: 'user_score_new'

  # post 'courses/:course_id/user_score/:user_id', to: 'user_scores#create', as: 'course_user_score_new'
  # post 'user_score/:course_id', to: 'user_scores#create', as: 'user_score'

  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
