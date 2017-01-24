Rails.application.routes.draw do

  root to: 'welcome#index'
  #user controller
  resources :users
  get    'signup', to: 'users#new'
  #sessions controller
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  resources :question_answers,defaults: { format: 'json' }, only: %i( index show create )
  delete :question_answers, to: "question_answers#destroy"
  get "answer", to:"question_answers#new"
end
